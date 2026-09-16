--- Blink completion source for skills available to Codex, Claude CLI, and opencode.
--- @class blink.cmp.Source
local M = {}

local cache = {}

local function read_file(path, max_lines)
  local ok, lines = pcall(vim.fn.readfile, path, "", max_lines or 200)
  return ok and lines or {}
end

local function trim_yaml_value(value)
  value = vim.trim(value or "")
  local quote = value:sub(1, 1)
  if (quote == '"' or quote == "'") and value:sub(-1) == quote then
    value = value:sub(2, -2)
  end
  return value
end

local function skill_metadata(path)
  local lines = read_file(path, 120)
  local metadata = {}
  local description_parts = {}
  local reading_description = false

  for index, line in ipairs(lines) do
    if index > 1 and line == "---" then
      break
    end

    local key, value = line:match("^([%w_-]+):%s*(.*)$")
    if key then
      reading_description = false
      if key == "name" then
        metadata.name = trim_yaml_value(value)
      elseif key == "user-invocable" then
        metadata.user_invocable = value ~= "false"
      elseif key == "description" then
        value = trim_yaml_value(value)
        reading_description = value == "" or value == ">" or value == "|"
        if not reading_description then
          table.insert(description_parts, value)
        end
      end
    elseif reading_description then
      local part = vim.trim(line)
      if part ~= "" then
        table.insert(description_parts, part)
      end
    end
  end

  metadata.name = metadata.name or vim.fs.basename(vim.fs.dirname(path))
  metadata.description = table.concat(description_parts, " ")
  return metadata
end

local function add_skill(result, seen, path, namespace, client)
  local metadata = skill_metadata(path)
  if metadata.name == "" or (client == "claude" and metadata.user_invocable == false) then
    return
  end

  local name = metadata.name
  if namespace and not name:find(":", 1, true) then
    name = namespace .. ":" .. name
  end
  if seen[name] then
    return
  end

  seen[name] = true
  table.insert(result, {
    name = name,
    description = metadata.description,
    path = path,
    namespace = namespace,
  })
end

local function scan_root(result, seen, root, namespace, client)
  root = vim.fs.normalize(vim.fn.expand(root))
  local stat = vim.uv.fs_stat(root)
  if not stat or stat.type ~= "directory" then
    return
  end

  local paths = vim.fs.find("SKILL.md", {
    path = root,
    type = "file",
    limit = 10000,
  })
  table.sort(paths)
  for _, path in ipairs(paths) do
    add_skill(result, seen, path, namespace, client)
  end
end

local function project_skill_roots(client)
  local roots = {}
  local current = vim.fs.normalize(vim.fn.getcwd())
  local relatives_map = {
    codex = { ".agents/skills", ".codex/skills" },
    claude = { ".agents/skills", ".claude/skills" },
    opencode = { ".opencode/skills" },
  }
  local relatives = relatives_map[client] or {}
  while current and current ~= "" do
    for _, relative in ipairs(relatives) do
      table.insert(roots, vim.fs.joinpath(current, relative))
    end
    local parent = vim.fs.dirname(current)
    if parent == current then
      break
    end
    current = parent
  end
  return roots
end

local function newest_child_directory(path)
  local newest, newest_time = nil, -1
  local stat = vim.uv.fs_stat(path)
  if not stat or stat.type ~= "directory" then
    return nil
  end

  for name, kind in vim.fs.dir(path) do
    if kind == "directory" then
      local candidate = vim.fs.joinpath(path, name)
      local candidate_stat = vim.uv.fs_stat(candidate)
      local modified = candidate_stat and candidate_stat.mtime.sec or 0
      if modified > newest_time then
        newest, newest_time = candidate, modified
      end
    end
  end
  return newest
end

local function codex_plugins()
  local config_path = vim.fn.expand("~/.codex/config.toml")
  local enabled = {}
  local current_plugin

  for _, line in ipairs(read_file(config_path, 10000)) do
    local section = line:match('^%[plugins%."([^"]+)"%]')
    if section then
      current_plugin = section
    elseif line:match("^%[") then
      current_plugin = nil
    elseif current_plugin and line:match("^enabled%s*=%s*true%s*$") then
      table.insert(enabled, current_plugin)
    end
  end

  local plugins = {}
  for _, key in ipairs(enabled) do
    local plugin, marketplace = key:match("^(.+)@(.+)$")
    if plugin and marketplace then
      local base = vim.fs.joinpath(vim.fn.expand("~/.codex/plugins/cache"), marketplace, plugin)
      local path = newest_child_directory(base)
      if path then
        table.insert(plugins, { name = plugin, path = path })
      end
    end
  end
  return plugins
end

local function decode_json_file(path)
  local lines = read_file(path, 100000)
  if #lines == 0 then
    return {}
  end
  local ok, decoded = pcall(vim.json.decode, table.concat(lines, "\n"))
  return ok and decoded or {}
end

local function claude_plugins()
  local settings = decode_json_file(vim.fn.expand("~/.claude/settings.json"))
  local installed = decode_json_file(vim.fn.expand("~/.claude/plugins/installed_plugins.json"))
  local enabled = settings.enabledPlugins or {}
  local plugins = {}

  for key, installations in pairs(installed.plugins or {}) do
    if enabled[key] == true then
      local name = key:match("^(.+)@") or key
      for _, installation in ipairs(installations) do
        if installation.installPath then
          table.insert(plugins, { name = name, path = installation.installPath })
        end
      end
    end
  end
  return plugins
end

local function collect_skills(client)
  local key = client .. "\0" .. vim.fn.getcwd()
  if cache[key] then
    return cache[key]
  end

  local result, seen = {}, {}
  local roots_map = {
    codex = "~/.codex/skills",
    claude = "~/.claude/skills",
    opencode = "~/.config/opencode/skills",
  }
  local home_root = roots_map[client]
  scan_root(result, seen, home_root, nil, client)

  for _, root in ipairs(project_skill_roots(client)) do
    scan_root(result, seen, root, nil, client)
  end

  local plugins = {}
  if client == "codex" then
    plugins = codex_plugins()
  elseif client == "claude" then
    plugins = claude_plugins()
  end
  for _, plugin in ipairs(plugins) do
    scan_root(result, seen, vim.fs.joinpath(plugin.path, "skills"), plugin.name, client)
  end

  table.sort(result, function(left, right)
    return left.name:lower() < right.name:lower()
  end)
  cache[key] = result
  return result
end

local function client_from_process_tree()
  local function command_has(command, executable)
    local from = 1
    while true do
      local first, last = command:find(executable, from, true)
      if not first then
        return false
      end
      local before = first == 1 and "" or command:sub(first - 1, first - 1)
      local after = last == #command and "" or command:sub(last + 1, last + 1)
      if (before == "" or before:match("[%s/]") or before == "@")
        and (after == "" or after:match("[%s/]") or after == ":")
      then
        return true
      end
      from = last + 1
    end
  end

  local pid = vim.uv.os_getppid()
  for _ = 1, 10 do
    if not pid or pid <= 1 then
      break
    end
    local output = vim.fn.systemlist({ "ps", "-o", "ppid=", "-o", "command=", "-p", tostring(pid) })[1]
    if not output then
      break
    end

    local parent, command = output:match("^%s*(%d+)%s+(.+)$")
    command = (command or ""):lower()
    if command_has(command, "claude") or command:find("claude-code", 1, true) then
      return "claude"
    elseif command_has(command, "codex") or command:find("@openai/codex", 1, true) then
      return "codex"
    end
    pid = tonumber(parent)
  end
end

function M.detect_client(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local forced = vim.b[bufnr].ai_cli_editor or vim.g.ai_cli_editor
  if forced == "codex" or forced == "claude" or forced == "opencode" then
    return forced
  end

  local filename = vim.api.nvim_buf_get_name(bufnr):lower()
  if filename:find("claude%-editor") then
    return "claude"
  elseif filename:find("codex%-editor") then
    return "codex"
  elseif filename:find("opencode%-editor") then
    return "opencode"
  end

  local process_client = client_from_process_tree()
  if process_client then
    return process_client
  elseif vim.env.CLAUDECODE == "1" or vim.env.CLAUDE_CODE_ENTRYPOINT then
    return "claude"
  elseif vim.env.CODEX_THREAD_ID or vim.env.CODEX_CLI then
    return "codex"
  elseif vim.env.OPENCODE == "1" or vim.env.OPENCODE_PID then
    return "opencode"
  end
end

function M.reload()
  cache = {}
end

function M.new()
  return setmetatable({}, { __index = M })
end

function M:enabled()
  return M.detect_client() ~= nil
end

function M:get_trigger_characters()
  return { "$", "/" }
end

function M:get_completions(context, callback)
  local client = M.detect_client(context.bufnr)
  if not client then
    return callback({ items = {}, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  local before_cursor = context.line:sub(1, context.cursor[2])
  local start_position, _, prefix = before_cursor:find("([$/])[%w_.:-]*$")
  local expected_prefix = client == "codex" and "$" or "/"
  if not start_position or prefix ~= expected_prefix then
    return callback({ items = {}, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  local preceding = start_position > 1 and before_cursor:sub(start_position - 1, start_position - 1) or ""
  if preceding:match("[%w_]") then
    return callback({ items = {}, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  local edit_range = {
    start = { line = context.cursor[1] - 1, character = start_position - 1 },
    ["end"] = { line = context.cursor[1] - 1, character = context.cursor[2] },
  }
  local items = {}

  for _, skill in ipairs(collect_skills(client)) do
    local documentation = skill.description
    if documentation ~= "" then
      documentation = documentation .. "\n\n"
    end
    documentation = documentation .. "`" .. skill.path .. "`"
    table.insert(items, {
      label = skill.name,
      filterText = skill.name,
      kind = vim.lsp.protocol.CompletionItemKind.Reference,
      detail = skill.namespace and ("Skill · " .. skill.namespace) or "Skill",
      documentation = { kind = "markdown", value = documentation },
      textEdit = {
        newText = prefix .. skill.name,
        range = edit_range,
      },
      insertTextFormat = vim.lsp.protocol.InsertTextFormat.PlainText,
    })
  end

  callback({
    items = items,
    is_incomplete_forward = false,
    is_incomplete_backward = false,
  })
end

return M

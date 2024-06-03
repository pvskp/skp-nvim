local function is_codeium_enabled()
  local enabled = vim.b["codeium_enabled"]
  if enabled == nil then
    enabled = vim.g["codeium_enabled"]
    if enabled == nil then
      enabled = true -- enable by default
    end
  end
  return enabled
end


return {
  'Exafunction/codeium.nvim',
  event = 'InsertEnter',
  -- cmd = 'CodeiumToggle',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- "hrsh7th/nvim-cmp",
  },
  opts = {
    enable_chat = true,
  },
  init = function()
    vim.api.nvim_create_user_command('CodeiumToggle', function()
      local new_enabled = not is_codeium_enabled()
      vim.b["codeium_enabled"] = new_enabled
      if new_enabled then
        vim.notify("Codeium enabled in buffer")
      else
        vim.notify("Codeium disabled in buffer")
      end
    end, {})
  end,
  config = function(_, opts)
    local Source = require("codeium.source")
    ---@diagnostic disable-next-line: duplicate-set-field
    function Source:is_available()
      local enabled = is_codeium_enabled()
      ---@diagnostic disable-next-line: undefined-field
      return enabled and self.server.is_healthy()
    end

    require("codeium").setup(opts)
  end
}

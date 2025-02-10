local M = {}

M._branch_name = ""

function M._set_branch(obj)
    if string.find(obj.stdout, "fatal: not a git repository") then
      M._branch_name = ""
    else
      M._branch_name = vim.trim(obj.stdout)
    end
end

function M._get_branch()
  vim.system({ "git", "branch", "--show-current" }, { text = true }, M._set_branch)
end

function M.get_branch()
  M._get_branch()
  return M._branch_name
end

-- function M.get_branch()
--   local branch = vim.trim(vim.fn.system({"git", "branch", "--show-current"}))
--   if string.find(branch, "fatal: not a git repository") then
--     return ""
--   end
--   return branch
-- end

return M

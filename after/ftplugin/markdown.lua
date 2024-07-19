for k, v in pairs({
  spell = true,
  spelllang = "pt_br,en",
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  wrap = false,
  conceallevel = 2,
}) do
  vim.opt_local[k] = v
end

local opts = { silent = false, noremap = true }

opts.desc = "Align table"
vim.keymap.set("v", "<leader>f", ":! tr -s ' ' | column -t -s '|' -o '|'<CR>", opts)

opts.desc = "Toggle checkbox"
vim.keymap.set("n", "<leader>x", function()
  local current_line_text = vim.api.nvim_get_current_line()
  local pattern_empty = '%- %[ %]'
  local pattern_filled = '%- %[x%]'
  if string.find(current_line_text, pattern_empty) ~= nil then
    vim.cmd('s/\\[ \\]/\\[x\\]')
  elseif string.find(current_line_text, pattern_filled) then
    vim.cmd('s/\\[x\\]/\\[ \\]')
  end
end, opts)

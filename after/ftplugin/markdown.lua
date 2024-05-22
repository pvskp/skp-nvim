local opts = {
  -- "setlocal spell",
  -- "setlocal spelllang=pt_br",
  'setlocal nowrap',
  'setlocal conceallevel=2',
}

for _, v in ipairs(opts) do
  vim.cmd(v)
end

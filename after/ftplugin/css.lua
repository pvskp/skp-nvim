vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('css_ftplugin', { clear = true }),
  pattern = 'style.css',
  callback = function(args)
    local target = vim.fn.expand('/home/paulov/dotfiles/.config/waybar/style.css')
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if bufname == target then
      -- vim.notify('Diagnostics disabled for ' .. target)
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end
  end,
})

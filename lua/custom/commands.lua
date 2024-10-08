vim.api.nvim_create_user_command('LspFormat', function()
  vim.lsp.buf.format()
end, {})

vim.api.nvim_create_user_command('RemoveANSI', function(ctx)
  vim.cmd [[ %s/\v(\x1b\[|\e\[)[0-9;]*[mGKH]//g ]]
end, {})

vim.api.nvim_create_user_command("SnipList", function()
  local ft_list = require("luasnip").available()[vim.o.filetype]
  local ft_snips = {}
  for _, item in pairs(ft_list) do
    ft_snips[item.trigger] = item.name
  end
  print(vim.inspect(ft_snips))
end, {})

-- Copy text to clipboard using codeblock format ```{ft}{content}```
vim.api.nvim_create_user_command('CopyCodeBlock', function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, true)
  local content = table.concat(lines, '\n')
  local result = string.format('```%s\n%s\n```', vim.bo.filetype, content)
  vim.fn.setreg('+', result)
  vim.notify 'Text copied to clipboard'
end, { range = true })

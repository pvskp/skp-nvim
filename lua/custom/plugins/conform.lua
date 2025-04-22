return {
  'stevearc/conform.nvim',
  event = { 'BufWrite', 'BufWritePre' },
  keys = {
    {
      '<leader>fm',
      function()
        local conform = require('conform')
        conform.format(
          {
            lsp_format = 'fallback',
          },
          -- @param err nil|err
          function(err, did_edit)
            if did_edit and err == nil then
              vim.notify('Buffer was successfully formatted', 2)
            elseif err ~= nil then
              vim.notify('Failed to format buffer: ' .. err, vim.log.levels.ERROR)
            end
          end
        )
      end,
    },
  },
  cmd = 'Conform',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'beautysh' },
      bash = { 'beautysh' },
      -- python = { 'autoflake', 'isort', 'black' },
      python = { 'ruff_format', 'ruff_fix' },
      javascript = { 'prettier' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      yaml = { 'prettier' },
      helm = { 'prettier' },
      cpp = { 'clang-format' },
      go = { 'goimports', 'gopls' },
      terraform = { 'terraform_fmt' },
      zsh = { 'beautysh' },
      sql = { 'sql_formatter' },
    },

    -- format_on_save = {
    --   -- I recommend these options. See :help conform.format for details.
    --   lsp_fallback = true,
    --   timeout_ms = 1000,
    --   quiet = true,
    --   callback = function(err, _)
    --     if err ~= nil then
    --       vim.notify 'Failed to format file. See :ConformInfo for more information.'
    --     end
    --   end,
    -- },
  },
  config = function(_, opts)
    require('conform').setup(opts)

    local conform_personal = vim.api.nvim_create_augroup('ConformPersonal', { clear = true })
    -- Use this instead format_on_save so I can exclude specific files
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = conform_personal,
      pattern = '*',
      callback = function(ctx)
        -- require("conform").format({ bufnr = ctx.buf })
        if vim.bo.filetype ~= 'yaml' then
          local ok, _ = pcall(require('conform').format, { bufnr = ctx.buf })
          if not ok then
            vim.notify('Conform: Failed to format buffer. Type ConformInfo for more information')
          end
        end
        -- if vim.fn.expand("%:t") ~= "rc.lua" then
        -- 	require("conform").format({ bufnr = ctx.buf })
        -- end
      end,
    })
  end,
}

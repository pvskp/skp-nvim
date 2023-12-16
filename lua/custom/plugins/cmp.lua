return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",         -- source for text in buffer
    "hrsh7th/cmp-path",           -- source for file system paths
    "amarakon/nvim-cmp-fonts",    -- source for font completion
    "L3MON4D3/LuaSnip",           -- snippet engine
    "saadparwaiz1/cmp_luasnip",   -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",       -- vs-code like pictograms
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {}, -- this is equalent to setup({}) function
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmd_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on("confirm_done", cmd_autopairs.on_confirm_done())
    vim.cmd("highlight! BorderBG guibg=NONE")
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup.filetype(
      { "conf", "config", "kitty" },
      { sources = { { name = "fonts", option = { space_filter = "-" } } } }
    )
    cmp.setup({
      preselect = cmp.PreselectMode.Item,
      experimental = {
        ghost_text = true,
      },
      completion = {
        completeopt = "menu,preview,noinsert",
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "double",
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({ border = "double" }),
      },
      snippet = {
        -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-l>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-h>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),    -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip" }, -- snippets
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "path" }, -- file system paths
        { name = "buffer" }, -- text within current buffer
        -- { name = "fonts", option = { space_filter = "-" } }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          symbol_map = { Copilot = "" },
          menu = {
            copilot = "[Copilot]",
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            fonts = "[Fonts]",
            latex_symbols = "[Latex]",
          },
        }),
      },
    })
  end,
}

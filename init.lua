require 'custom'
require 'custom.autocommands'
require 'custom.commands'
require 'custom.globals'
require 'custom.remap'
require 'custom.set'


spec(false, 'colorscheme.github')
spec(false, 'colorscheme.zenbones')
spec(false, 'colorscheme.vscode')
spec(false, 'colorscheme.tokyonight')
spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(false, 'colorscheme.neosolarized')
spec(false, 'colorscheme.moonlight')
spec(false, 'colorscheme.monokai')
spec(false, 'colorscheme.minimal')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.mellifluous')
spec(false, 'colorscheme.material')
spec(false, 'colorscheme.kanagawa')
spec(false, 'colorscheme.hybrid')
spec(false, 'colorscheme.gruvbox-material')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.everforest')
spec(false, 'colorscheme.cyberdream')
spec(true, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.aura')
spec(false, 'colorscheme.adwaita')

-- vim.cmd [[colorscheme habamax]]

--<< LSP related >>--

spec(true, 'lsp.treesiter')
spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.neodev')    -- offers completion to neovim functions
spec(true, 'lsp.navbuddy')  -- allow to navigate between symbols in a easier way
spec(true, 'lsp.luasnip')   -- snippets
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.lsp_signature')
spec(true, 'lsp.conform')             -- formatter
spec(true, 'lsp.cmp')                 -- completion
spec(false, 'lsp.rainbow-delimiters') -- show matching delimiters
spec(false, 'lsp.outline')
spec(false, 'lsp.lsp-saga')
spec(false, 'lsp.commentary')

--<< Language specific >>--

spec(true, 'languages.helm')
spec(false, 'languages.golang') -- go integration

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.hipatterns')
spec(false, 'mini.ai')
spec(false, 'mini.animate')
spec(true, 'mini.files') -- minitree (best tree plugin)
spec(false, 'mini.notify')

--<< Git integrations >>--

spec(false, 'git.lazygit')  -- lazygit inside neovim
spec(true, 'git.gitsigns')  -- show git signs on columnsign
spec(false, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(true, 'git.gitmoji')
spec(true, 'git.neogit')
spec(false, 'git.diffview')
spec(false, 'git.blame')

--<< General >>--

spec(true, 'which-key')
spec(true, 'undotree')  -- show undo tree
spec(true, 'trouble')   -- cool quickfix list for LSP
spec(true, 'tmux')      -- tmux integration
spec(true, 'telescope') -- fuzzy finder
spec(true, 'surround')  -- surround text with quotes, brackets, etc
spec(false, 'oil')
spec(true, 'treesj')
spec(true, 'neogen')
spec(true, 'neo-zoom') -- toggle zoom mode with a popup window
spec(true, 'maximizer')
spec(true, 'obsidian')
spec(true, 'markdown-preview')
spec(true, 'hop')      -- jump to any word in the screen
spec(true, 'eyeliner') -- quick jump with f, F, t, T
spec(true, 'emoji')
spec(true, 'ccc')
spec(true, 'bigfile')
spec(true, 'autopairs')
spec(true, 'auto-session')
spec(false, 'modicator')
spec(true, 'kitty')    -- kitty integration
spec(false, 'flybuf')
spec(false, 'discord') -- rich presence
spec(false, 'dired')   -- emacs like file manager
spec(false, 'color-picker')
spec(false, 'cmdbuf')
spec(false, 'btterm') -- this one is mine!!!!

--<< AI >>--

spec(true, 'ai.codeium')
spec(false, 'ai.gp')
spec(false, 'ai.chatgpt')
spec(false, 'ai.copilot')

--<< UI >>--

spec(false, 'ui.transparent')
spec(true, 'ui.nvim-bqf')
spec(true, 'ui.lualine')     -- statusline
spec(true, 'ui.indentlines') -- show indent lines
spec(true, 'ui.illuminate')
spec(true, 'ui.fidget')      -- cool LSP notification
spec(true, 'ui.dressing')    -- offers better ui for some neovim commands
spec(true, 'ui.devicons')
spec(true, 'ui.colorizer')   -- color preview
spec(false, 'ui.barbecue')   -- shows the current symbol and its parents
spec(true, 'ui.alpha')       -- start dashboard
spec(false, 'ui.virt-column')
spec(false, 'ui.twilight')
spec(false, 'ui.sunglasses')
spec(false, 'ui.netrw')
spec(false, 'ui.headlines')
spec(false, 'ui.bufferline')

--<< Lualine integrations >>--

spec(true, 'ui.lualine.clock')
spec(false, 'ui.lualine.battery')

-- Loads all with lazy
require 'custom.lazy'
require 'custom.highlight' -- required to be loaded after lazy

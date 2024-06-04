require 'custom'
require 'custom.autocommands'
require 'custom.commands'
require 'custom.globals'
require 'custom.remap'
require 'custom.set'
require 'custom.utils'

--<< colorschemes >>--
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.zenbones')
spec(false, 'colorscheme.vscode')
spec(true, 'colorscheme.tokyonight')
spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(false, 'colorscheme.neosolarized')
spec(false, 'colorscheme.moonlight')
spec(false, 'colorscheme.minimal')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.mellifluous')
spec(false, 'colorscheme.kanagawa')
spec(false, 'colorscheme.monokai')
spec(false, 'colorscheme.gruvbox-material')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.material')
spec(false, 'colorscheme.github')
spec(false, 'colorscheme.everforest')
spec(false, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.aura')
spec(false, 'colorscheme.adwaita')
spec(false, 'colorscheme.hybrid')
spec(false, 'colorscheme.cyberdream')

-- vim.cmd [[colorscheme default]]

--<< LSP related >>--

spec(true, 'lsp.treesiter') -- love and hate relationship with this one
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

spec(false, 'languages.markdown')
spec(true, 'languages.helm')
spec(false, 'languages.golang') -- go integration

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.hipatterns')
spec(true, 'mini.animate')
spec(true, 'mini.files') -- minitree (best tree plugin)
spec(false, 'mini.notify')

--<< Git integrations >>--

spec(true, 'git.lazygit')  -- lazygit inside neovim
spec(true, 'git.gitsigns') -- show git signs on columnsign
spec(true, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(true, 'git.gitmoji')
spec(false, 'git.neogit')
spec(false, 'git.diffview')
spec(false, 'git.blame')

--<< General >>--

spec(true, 'undotree')  -- show undo tree
spec(false, 'kube-utils')
spec(true, 'trouble')   -- cool quickfix list for LSP
spec(true, 'tmux')      -- tmux integration
spec(true, 'telescope') -- fuzzy finder
spec(true, 'surround')  -- surround text with quotes, brackets, etc
spec(true, 'neogen')
spec(true, 'neo-zoom')  -- toggle zoom mode with a popup window
spec(true, 'modicator')
spec(true, 'markdown-preview')
spec(true, 'hop')      -- jump to any word in the screen
spec(false, 'focus')   -- auto-resize windows when switching buffers
spec(true, 'maximizer')
spec(true, 'eyeliner') -- quick jump with f, F, t, T
spec(true, 'discord')  -- rich presence
spec(false, 'btterm')  -- this one is mine!!!!
spec(true, 'bigfile')
spec(true, 'autopairs')
spec(true, 'auto-session')
spec(true, 'ccc')
spec(false, 'wilder')
spec(false, 'which-key')
spec(false, 'vim-be-good')
spec(false, 'ufo') -- deal with folding in a better way
spec(false, 'toggle-checkbox')
spec(false, 'tetris')
spec(false, 'spider')
spec(false, 'remote-containers')
spec(false, 'remote-containers')
spec(false, 'oil')
spec(false, 'obsidian')
spec(false, 'nvim-tree')
spec(false, 'neoscroll')
spec(false, 'neo-tree')
spec(false, 'modes')
spec(false, 'lab')
spec(false, 'kubectl')  -- kubectl integration
spec(false, 'kitty')    -- kitty integration
spec(false, 'hawtkeys') -- show best keybindings to be mapped
spec(false, 'harpoon')
spec(false, 'hardtime')
spec(false, 'hardmode')
spec(false, 'flybuf')
spec(false, 'fakeclip')
spec(false, 'color-picker')
spec(false, 'cmdbuf')

--<< AI >>--

spec(true, 'ai.codeium')
spec(false, 'ai.gp')
spec(false, 'ai.chatgpt')
spec(false, 'ai.copilot')

--<< UI >>--

spec(true, 'ui.transparent')
spec(true, 'ui.nvim-bqf')
spec(true, 'ui.lualine')     -- statusline
spec(true, 'ui.indentlines') -- show indent lines
spec(true, 'ui.illuminate')
spec(true, 'ui.fidget')      -- cool LSP notification
spec(true, 'ui.dressing')    -- offers better ui for some neovim commands
spec(true, 'ui.devicons')
spec(true, 'ui.colorizer')   -- color preview
spec(true, 'ui.barbecue')    -- shows the current symbol and its parents
spec(false, 'ui.virt-column')
spec(false, 'ui.twilight')
spec(false, 'ui.sunglasses')
spec(false, 'ui.netrw')
spec(false, 'ui.headlines')
spec(false, 'ui.bufferline')
spec(true, 'ui.alpha') -- start dashboard

--<< Lualine integrations >>--

spec(true, 'ui.lualine.clock')
spec(false, 'ui.lualine.battery')

-- Loads all with lazy
require 'custom.lazy'
require 'custom.highlight' -- required to be loaded after lazy

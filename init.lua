require 'custom'
require 'custom.autocommands'
require 'custom.globals'
require 'custom.remap'
require 'custom.set'
require 'custom.utils'

--<< colorschemes >>--

spec(poff, 'colorscheme.github')
spec(poff, 'colorscheme.gruvbox')
spec(poff, 'colorscheme.base16')
spec(poff, 'colorscheme.neosolarized')
spec(poff, 'colorscheme.mellifluous')
spec(poff, 'colorscheme.midnight')
spec(poff, 'colorscheme.zenbones')
spec(poff, 'colorscheme.minimal')
spec(pon, 'colorscheme.vscode')
spec(poff, 'colorscheme.tokyonight')
spec(poff, 'colorscheme.rose-pine')
spec(poff, 'colorscheme.kanagawa')
spec(poff, 'colorscheme.onedark')
spec(poff, 'colorscheme.nord')
spec(poff, 'colorscheme.moonlight')
spec(poff, 'colorscheme.gruvbox-material')
spec(poff, 'colorscheme.everforest')
spec(poff, 'colorscheme.catppuccin')
spec(poff, 'colorscheme.ayu')
spec(poff, 'colorscheme.adwaita')
-- vim.cmd([[colorscheme habamax]])
-- vim.cmd([[colorscheme murphy]])

--<< LSP related >>--

spec(pon, 'lsp.treesiter') -- love and hate relationship with this one
spec(poff, 'lsp.rainbow-delimiters') -- show matching delimiters
spec(pon, 'lsp.neodev') -- offers completion to neovim functions
spec(pon, 'lsp.navbuddy') -- allow to navigate between symbols in a easir way
spec(poff, 'lsp.mason') -- download lsp servers, fomratters, etc
spec(pon, 'lsp.luasnip') -- snippets
spec(pon, 'lsp.lspconfig')
spec(pon, 'lsp.conform') -- formatter
spec(pon, 'lsp.commentary')
spec(pon, 'lsp.cmp') -- completion
spec(poff, 'lsp.outline')
spec(pon, 'lsp.nvim-lint') -- linting
spec(poff, 'lsp.lsp-saga')

--<< Language specific >>--

spec(pon, 'languages.golang') -- go integration
spec(pon, 'languages.helm')

--<< Mini library >>--

spec(pon, 'mini.splitjoin')
spec(poff, 'mini.notify')
spec(poff, 'mini.files') -- minitree (best tree plugin)

--<< Git integrations >>--

spec(pon, 'git.lazygit') -- lazygit inside neovim
spec(poff, 'git.gitsigns') -- show git signs on columnsign
spec(pon, 'git.fugitive') -- git integration
spec(poff, 'git.diffview')
spec(poff, 'git.neogit')
spec(poff, 'git.blame')

--<< General >>--

spec(pon, 'undotree') -- show undo tree
spec(pon, 'neo-zoom') -- toggle zoom mode with a popup window
spec(pon, 'trouble') -- cool quickfix list for LSP
spec(pon, 'toggle-checkbox')
spec(pon, 'tmux') -- tmux integration
spec(pon, 'telescope') -- fuzzy finder
spec(pon, 'surround') -- surround text with quotes, brackets, etc
spec(poff, 'remote-containers')
spec(pon, 'oil')
spec(pon, 'obsidian')
spec(pon, 'nvim-tree')
spec(pon, 'neogen')
spec(pon, 'markdown-preview')
spec(pon, 'kitty') -- kitty integration
spec(pon, 'hop') -- jump to any word in the screen
spec(pon, 'focus') -- auto-resize windows when switching buffers
spec(pon, 'eyeliner') -- quick jump with f, F, t, T
spec(pon, 'discord') -- rich presence
spec(pon, 'btterm') -- this one is mine!!!!
spec(pon, 'autopairs')
spec(pon, 'auto-session')
spec(poff, 'wilder')
spec(poff, 'which-key')
spec(poff, 'vim-be-good')
spec(poff, 'ufo') -- deal with folding in a better way
spec(poff, 'tetris')
spec(poff, 'spider')
spec(poff, 'remote-containers')
spec(poff, 'neoscroll')
spec(poff, 'neo-tree')
spec(poff, 'modes')
spec(poff, 'lab')
spec(poff, 'kubectl') -- kubectl integration
spec(poff, 'hawtkeys') -- show best keybindings to be mapped
spec(poff, 'harpoon')
spec(poff, 'hardtime')
spec(poff, 'hardmode')
spec(poff, 'flybuf')
spec(poff, 'fakeclip')
spec(poff, 'color-picker')
spec(poff, 'cmdbuf')

--<< AI >>--

spec(pon, 'ai.codeium')
spec(pon, 'ai.gp')
spec(poff, 'ai.chatgpt')
spec(poff, 'ai.copilot')

--<< UI >>--

spec(pon, 'ui.lualine') -- statusline
spec(pon, 'ui.devicons')
spec(pon, 'ui.indentlines') -- show indent lines
spec(pon, 'ui.fidget') -- cool LSP notification
spec(pon, 'ui.dressing') -- offers better ui for some neovim commands
spec(pon, 'ui.colorizer') -- color preview
spec(pon, 'ui.barbecue') -- shows the current symbol and its parents
spec(poff, 'ui.transparent')
spec(poff, 'ui.bufferline')
spec(poff, 'ui.virt-column')
spec(poff, 'ui.twilight')
spec(poff, 'ui.sunglasses')
spec(poff, 'ui.netrw')
spec(pon, 'ui.illuminate')
spec(poff, 'ui.headlines')
spec(poff, 'ui.alpha') -- start dashboard

--<< Lualine integrations >>--

spec(pon, 'ui.lualine.battery')
spec(pon, 'ui.lualine.copilot')
spec(pon, 'ui.lualine.clock')

-- Loads all with lazy
require 'custom.lazy'
require 'custom.highlight' -- required to be loaded after lazy

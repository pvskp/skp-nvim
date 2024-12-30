require 'custom'

require 'custom.autocommands'
require 'custom.commands'
require 'custom.globals'
require 'custom.remap'
require 'custom.window'
require 'custom.tabs'
require 'custom.netrw'
require 'custom.commandline'
-- require 'custom.terminal'
require 'custom.set'
require 'custom.colors'
-- require 'custom.default-colorscheme'
-- require 'custom.habamax'

spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.tokyo-night')
spec(false, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(true, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.adwaita')

--<< LSP related >>--

spec(true, 'lsp.treesiter')
spec(true, 'lsp.barbecue')
spec(false, 'lsp.dropbar')
spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.lazydev')   -- offers completion to neovim functions
spec(true, 'lsp.navbuddy') -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.mason-installer')
spec(true, 'lsp.conform') -- formatter
spec(true, 'lsp.cmp')     -- completion
spec(false, 'lsp.blink')     -- completion

--<< Language specific >>--

spec(true, 'languages.helm')
spec(false, 'languages.markdown.render-markdown')

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.ai')
spec(true, 'mini.hipatterns')
spec(true, 'mini.files') -- minitree (best tree plugin)
spec(false, 'mini.indentscope')

--<< Git integrations >>--

spec(true, 'git.gitsigns') -- show git signs on columnsign
spec(true, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(true, 'git.neogit')

--<< General >>--

spec(true, 'undotree')            -- show undo tree
spec(true, 'tmux')                -- tmux integration
spec(false, 'telescope.telescope') -- fuzzy finder
spec(true, 'fzf-lua') -- fuzzy finder
spec(true, 'surround')            -- surround text with quotes, brackets, etc
spec(true, 'hop')                 -- jump to any word in the screen
spec(false, 'eyeliner')            -- quick jump with f, F, t, T
spec(true, 'which-key')
spec(true, 'scriptease')
spec(true, 'vim-zoom')
spec(true, 'codesnap')
spec(true, 'neogen')
spec(false, 'nvim-tree')
spec(true, 'quarto')
spec(true, 'slime')
spec(true, 'quicker')
spec(true, 'ccc')
spec(false, 'w3m')
spec(false, 'bigfile') --NOTE disabled for snacks.nvim
spec(true, 'autopairs')
spec(true, 'auto-session')
spec(false, 'persistence')
spec(true, 'ibl')

--<< AI >>--

spec(false, 'ai.codeium')
spec(false, 'ai.copilot')

--<< UI >>--

spec(true, 'ui.lualine')          -- statusline
spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.dressing')         -- offers better ui for some neovim commands
spec(false, 'ui.alpha')            -- start dashboard #NOTE disabled for snacks.nvim
spec(true, 'ui.devicons')
spec(false, 'ui.noice')

--<< Snacks >>--
spec(true, 'snacks')

-- Loads all with lazy
require 'custom.lazy'
require 'custom.highlight' -- required to be loaded after lazy

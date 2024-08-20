require 'custom'

require 'custom.autocommands'
require 'custom.commands'
require 'custom.globals'
require 'custom.remap'
require 'custom.window'
require 'custom.tabs'
require 'custom.netrw'
require 'custom.commandline'
require 'custom.terminal'
require 'custom.set'
require 'custom.colors'
require 'custom.default-colorscheme'
-- require 'custom.habamax'

spec(true, 'colorscheme.rose-pine')
spec(false, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(false, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.adwaita')


-- vim.cmd [[colorscheme habamax]]

--<< LSP related >>--

spec(true, 'lsp.treesiter')
spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.neodev')    -- offers completion to neovim functions
spec(true, 'lsp.navbuddy')  -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.conform')   -- formatter
spec(true, 'lsp.cmp')       -- completion

--<< Language specific >>--

spec(true, 'languages.helm')
spec(false, 'languages.markdown.render-markdown')

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.ai')
spec(true, 'mini.hipatterns')
spec(true, 'mini.files') -- minitree (best tree plugin)

--<< Git integrations >>--

spec(true, 'git.gitsigns') -- show git signs on columnsign
spec(true, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(true, 'git.gitmoji')
spec(true, 'git.neogit')

--<< General >>--

spec(true, 'which-key')
spec(true, 'undotree')            -- show undo tree
spec(true, 'tmux')                -- tmux integration
spec(true, 'telescope.telescope') -- fuzzy finder
spec(true, 'surround')            -- surround text with quotes, brackets, etc
spec(true, 'codesnap')
spec(true, 'neogen')
spec(true, 'quicker')
spec(true, 'hop')      -- jump to any word in the screen
spec(true, 'eyeliner') -- quick jump with f, F, t, T
spec(true, 'emoji')
spec(true, 'ccc')
spec(true, 'w3m')
spec(true, 'bigfile')
spec(true, 'autopairs')
spec(true, 'auto-session')

--<< AI >>--

spec(true, 'ai.codeium')
spec(false, 'ai.copilot')

--<< UI >>--

spec(false, 'ui.lualine')         -- statusline
spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.dressing')         -- offers better ui for some neovim commands
spec(true, 'ui.alpha')            -- start dashboard
spec(true, 'ui.devicons')
spec(false, 'ui.noice')

-- Loads all with lazy
require 'custom.lazy'
require 'custom.highlight' -- required to be loaded after lazy

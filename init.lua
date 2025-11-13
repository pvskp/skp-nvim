require('custom')

require('config.autocommands')
require('config.commands')
require('config.globals')
require('config.remap')
require('config.window')
require('config.tabs')
require('config.netrw')
-- require 'config.statusline'
require('config.commandline')
-- require 'config.terminal'
require('config.set')
-- require('config.colors')
-- require 'config.default-colorscheme'
-- require 'config.habamax'

spec(false, 'colorscheme.tokyo-night')
spec(false, 'colorscheme.vscode')
spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.pywal')
spec(false, 'colorscheme.onedark')
spec(true, 'colorscheme.nord')
spec(false, 'colorscheme.moonfly')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.kanagawa')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.fluoromachine')
spec(false, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.adwaita')

spec(true, 'treesiter')
spec(true, 'conform') -- formatter
spec(true, 'lazydev') -- offers completion to neovim functions

--<< LSP related >>--

spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.navbuddy') -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.blink') -- completion
spec(true, 'lsp.dropbar')
spec(false, 'lsp.cmp') -- completion

--<< Language specific >>--

spec(false, 'languages.helm')
spec(false, 'languages.markdown.render-markdown')
spec(false, 'languages.markdown.preview')

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.ai')
spec(true, 'mini.hipatterns')
spec(true, 'mini.files') -- minitree (best tree plugin)

--<< Git integrations >>--

spec(true, 'git.gitsigns') -- show git signs on columnsign
spec(true, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(false, 'git.neogit')

--<< General >>--

spec(true, 'which-key')
spec(true, 'undotree') -- show undo tree
spec(true, 'todo-comments')
spec(true, 'tmux') -- tmux integration
spec(true, 'surround') -- surround text with quotes, brackets, etc
spec(false, 'oil')
spec(true, 'neotest')
spec(true, 'neogen')
spec(true, 'hop') -- jump to any word in the screen
spec(true, 'harpoon')
spec(true, 'debugger')
spec(true, 'ccc')
spec(true, 'auto-session')
spec(true, 'autopairs')
spec(true, 'tpipeline')
spec(false, 'yazi')
spec(false, 'w3m')
spec(false, 'vim-zoom')
spec(false, 'slime')
spec(false, 'ranger')
spec(false, 'quicker')
spec(false, 'quarto')
spec(false, 'neo-tree')
spec(false, 'minty')
spec(false, 'image')
spec(false, 'hawtkeys')
spec(false, 'codesnap')

--<< AI >>--

spec(true, 'ai.sidekick')
spec(false, 'ai.mcphub')
spec(false, 'ai.copilot-vim')
spec(false, 'ai.copilot-chat')
spec(false, 'ai.copilot')
spec(false, 'ai.codeium')
spec(false, 'ai.codecompanion')
spec(false, 'ai.avante')

--<< UI >>--

spec(true, 'ui.statusline')
spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.devicons')
spec(false, 'ui.ibl')
spec(false, 'ui.dressing') -- offers better ui for some neovim commands

--<< Snacks >>--
spec(true, 'snacks')

-- vim.api.nvim_create_user_command('Hello', function()
--   vim.cmd 'Ex'
-- end, {})

-- Loads all with lazy
-- spec(true, 'current-theme.theme.neovim') -- sync theme with system
require('custom.lazy')
-- require('config.theme') -- load system theme
require('config.highlight') -- required to be loaded after lazy

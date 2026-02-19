require('custom')

require('config.autocommands')
require('config.commands')
require('config.globals')
require('config.remap')
require('config.window')
require('config.tabs')
require('config.netrw')
require('config.commandline')
-- require 'config.terminal'
require('config.set')
-- require 'config.default-colorscheme'

spec(false, 'colorscheme.tokyo-night')
spec(false, 'colorscheme.vscode')
spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.pywal')
spec(false, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(false, 'colorscheme.moonfly')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.kanagawa')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.fluoromachine')
spec(false, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.adwaita')
spec(false, 'colorscheme.kecleon')
spec(true, 'colorscheme.omarchy')

spec(true, 'treesiter')
spec(true, 'conform') -- formatter
spec(true, 'lazydev') -- offers completion to neovim functions

--<< LSP related >>--

spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.navbuddy') -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.trouble')
spec(true, 'lsp.blink') -- completion
spec(false, 'lsp.dropbar')

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
spec(false, 'neo-tree')
spec(true, 'tmux') -- tmux integration
spec(true, 'surround') -- surround text with quotes, brackets, etc
spec(false, 'oil')
spec(true, 'neotest')
spec(true, 'neogen')
spec(true, 'harpoon')
spec(true, 'debugger')
spec(true, 'ccc')
spec(true, 'auto-session')
spec(false, 'marcador')
spec(true, 'autopairs')
spec(false, 'tpipeline')
spec(false, 'weather')
spec(true, 'vimwiki')
spec(true, 'kulala')
spec(false, 'ranger')
spec(false, 'quicker')
spec(false, 'codesnap')

--<< AI >>--

spec(true, 'ai.sidekick')
spec(false, 'ai.mcphub')
spec(false, 'ai.copilot-vim')
spec(false, 'ai.copilot-chat')
spec(false, 'ai.copilot')
spec(false, 'ai.codeium')
spec(true, 'ai.codecompanion')
spec(false, 'ai.avante')

--<< UI >>--

spec(true, 'ui.statusline')
spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.devicons')
spec(false, 'ui.dressing') -- offers better ui for some neovim commands

--<< Snacks >>--
spec(true, 'snacks')

-- Loads all with lazy
-- spec(true, 'current-theme.theme.neovim') -- sync theme with system
require('config.highlight') -- required to be loaded after lazy
require('custom.lazy')
-- require('config.theme') -- load system theme

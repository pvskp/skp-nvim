require('custom')

require('custom.autocommands')
require('custom.commands')
require('custom.globals')
require('custom.remap')
require('custom.window')
require('custom.tabs')
require('custom.netrw')
-- require 'custom.statusline'
require('custom.commandline')
-- require 'custom.terminal'
require('custom.set')
require('custom.colors')
-- require 'custom.default-colorscheme'
-- require 'custom.habamax'

spec(false, 'colorscheme.rose-pine')
spec(false, 'colorscheme.gruvbox')
spec(false, 'colorscheme.tokyo-night')
spec(false, 'colorscheme.vscode')
spec(false, 'colorscheme.kanagawa')
spec(true, 'colorscheme.onedark')
spec(false, 'colorscheme.nord')
spec(false, 'colorscheme.catppuccin')
spec(false, 'colorscheme.base16')
spec(false, 'colorscheme.midnight')
spec(false, 'colorscheme.ayu')
spec(false, 'colorscheme.moonfly')
spec(false, 'colorscheme.fluoromachine')
spec(false, 'colorscheme.adwaita')

spec(true, 'treesiter')
spec(true, 'conform') -- formatter
spec(true, 'lazydev') -- offers completion to neovim functions

--<< LSP related >>--

spec(true, 'lsp.barbecue')
spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.navbuddy') -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.mason-installer')
spec(false, 'lsp.cmp') -- completion
spec(true, 'lsp.blink') -- completion

--<< Language specific >>--

spec(true, 'languages.helm')
spec(true, 'languages.markdown.render-markdown')

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.ai')
spec(true, 'mini.hipatterns')
spec(false, 'mini.files') -- minitree (best tree plugin)

--<< Git integrations >>--

spec(true, 'git.gitsigns') -- show git signs on columnsign
spec(true, 'git.fugitive') -- git integration
spec(true, 'git.conflict')
spec(true, 'git.neogit')

--<< General >>--

spec(true, 'oil')
spec(true, 'undotree') -- show undo tree
spec(true, 'tmux') -- tmux integration
spec(true, 'surround') -- surround text with quotes, brackets, etc
spec(true, 'hop') -- jump to any word in the screen
spec(true, 'which-key')
-- spec(true, 'scriptease')
spec(false, 'vim-zoom')
spec(true, 'codesnap')
spec(true, 'debugger')
spec(true, 'neogen')
spec(true, 'quarto')
spec(true, 'slime')
spec(true, 'quicker')
spec(true, 'ccc')
spec(false, 'w3m')
spec(false, 'autopairs')
spec(true, 'hawtkeys')
spec(true, 'auto-session')
spec(true, 'todo-comments')
spec(true, 'oil')

--<< AI >>--

spec(false, 'ai.codeium')
spec(false, 'ai.copilot')
spec(false, 'ai.copilot-vim')
spec(true, 'ai.avante')
spec(false, 'ai.codecompanion')
spec(true, 'ai.copilot-chat')
spec(true, 'ai.mcphub')

--<< UI >>--

spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.dressing') -- offers better ui for some neovim commands
spec(true, 'ui.devicons')
spec(true, 'ui.statusline')

--<< Snacks >>--
spec(true, 'snacks')

-- vim.api.nvim_create_user_command('Hello', function()
--   vim.cmd 'Ex'
-- end, {})

-- Loads all with lazy
require('custom.lazy')
require('custom.highlight') -- required to be loaded after lazy

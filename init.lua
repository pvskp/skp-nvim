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
-- require('custom.colors')
-- require 'custom.default-colorscheme'
-- require 'custom.habamax'

spec(true, 'colorscheme.onedark')
spec(false, 'colorscheme.vscode')
spec(false, 'colorscheme.tokyo-night')
spec(false, 'colorscheme.rose-pine')
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

spec(true, 'treesiter')
spec(true, 'conform') -- formatter
spec(true, 'lazydev') -- offers completion to neovim functions

--<< LSP related >>--

spec(true, 'lsp.nvim-lint') -- linting
spec(true, 'lsp.navbuddy') -- allow to navigate between symbols in a easier way
spec(true, 'lsp.lspconfig')
spec(true, 'lsp.blink') -- completion
spec(true, 'lsp.barbecue')
spec(false, 'lsp.cmp') -- completion

--<< Language specific >>--

spec(true, 'languages.helm')
spec(true, 'languages.markdown.render-markdown')
spec(true, 'languages.markdown.preview')

--<< Mini library >>--

spec(true, 'mini.splitjoin')
spec(true, 'mini.ai')
spec(true, 'mini.hipatterns')
spec(false, 'mini.files') -- minitree (best tree plugin)

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
spec(true, 'oil')
spec(true, 'neogen')
spec(true, 'hop') -- jump to any word in the screen
spec(true, 'debugger')
spec(true, 'ccc')
spec(false, 'yazi')
spec(true, 'ranger')
spec(true, 'auto-session')
spec(false, 'w3m')
spec(false, 'vim-zoom')
spec(false, 'slime')
spec(false, 'quicker')
spec(false, 'quarto')
spec(false, 'hawtkeys')
spec(false, 'codesnap')
spec(false, 'autopairs')

--<< AI >>--

spec(true, 'ai.mcphub')
spec(true, 'ai.copilot-chat')
spec(true, 'ai.avante')
spec(false, 'ai.copilot-vim')
spec(false, 'ai.copilot')
spec(false, 'ai.codeium')
spec(false, 'ai.codecompanion')

--<< UI >>--

spec(true, 'ui.statusline')
spec(true, 'ui.highlight-colors') -- color preview
spec(true, 'ui.devicons')
spec(false, 'ui.dressing') -- offers better ui for some neovim commands

--<< Snacks >>--
spec(true, 'snacks')

-- vim.api.nvim_create_user_command('Hello', function()
--   vim.cmd 'Ex'
-- end, {})

-- Loads all with lazy
require('custom.lazy')
require('custom.highlight') -- required to be loaded after lazy

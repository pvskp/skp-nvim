require("custom")
require("custom.autocommands")
require("custom.globals")
require("custom.remap")
require("custom.set")
require("custom.utils")

--<< colorschemes >>--

spec(pon, "colorscheme.github")
spec(poff, "colorscheme.vscode")
spec(poff, "colorscheme.tokyonight")
spec(poff, "colorscheme.rose-pine")
spec(poff, "colorscheme.onedark")
spec(poff, "colorscheme.nord")
spec(poff, "colorscheme.moonlight")
spec(poff, "colorscheme.gruvbox-material")
spec(poff, "colorscheme.everforest")
spec(poff, "colorscheme.catppuccin")
spec(poff, "colorscheme.ayu")
spec(poff, "colorscheme.adwaita")

--<< LSP related >>--

spec(pon, "lsp.conform") -- formatter
spec(pon, "lsp.lspconfig")
spec(pon, "lsp.mason") -- download lsp servers, fomratters, etc
spec(pon, "lsp.navbuddy") -- allow to navigate between symbols in a easir way
spec(pon, "lsp.nvim-lint") -- linting
spec(pon, "lsp.cmp") -- completion
spec(pon, "lsp.treesiter") -- love and hate relationship with this one
spec(pon, "lsp.luasnip") -- snippets
spec(pon, "lsp.commentary")
spec(pon, "lsp.rainbow-delimiters") -- show matching delimiters
spec(pon, "lsp.neodev") -- offers completion to neovim functions
spec(pon, "lsp.outline")
spec(poff, "lsp.lsp-saga") -- offers completion to neovim functions

--<< Language specific >>--

spec(pon, "languages.golang") -- go integration
spec(pon, "languages.helm")

--<< Mini library >>--

spec(poff, "mini.files") -- minitree (best tree plugin)
spec(pon, "mini.splitjoin") -- minitree (best tree plugin)
spec(poff, "mini.notify") -- minitree (best tree plugin)

--<< Git integrations >>--

spec(pon, "git.lazygit") -- lazygit inside neovim
spec(pon, "git.gitsigns") -- show git signs on columnsign
spec(pon, "git.fugitive") -- git integration
spec(poff, "git.neogit")
spec(poff, "git.blame")

--<< General >>--

spec(pon, "undotree") -- show undo tree
spec(pon, "trouble") -- cool quickfix list for LSP
spec(pon, "tmux") -- tmux integration
spec(pon, "telescope") -- fuzzy finder
spec(pon, "surround") -- surround text with quotes, brackets, etc
spec(pon, "kubectl") -- kubectl integration
spec(pon, "kitty") -- kitty integration
spec(pon, "hop") -- jump to any word in the screen
spec(pon, "focus") -- auto-resize windows when switching buffers
spec(pon, "eyeliner") -- quick jump with f, F, t, T
spec(pon, "discord") -- rich presence
spec(pon, "btterm") -- this one is mine!!!!
spec(pon, "autopairs")
spec(pon, "auto-session")
spec(poff, "wilder")
spec(poff, "which-key")
spec(poff, "vim-be-good")
spec(poff, "ufo") -- deal with folding in a better way
spec(poff, "tetris")
spec(poff, "spider")
spec(pon, "oil")
spec(poff, "nvim-tree")
spec(poff, "neoscroll")
spec(poff, "neo-tree")
spec(poff, "lab")
spec(pon, "hawtkeys") -- show best keybindings to be mapped
spec(poff, "harpoon")
spec(poff, "hardtime")
spec(poff, "hardmode")
spec(poff, "flybuf")
spec(poff, "fakeclip")
spec(poff, "color-picker")
spec(poff, "cmdbuf")

--<< AI >>--

spec(pon, "ai.codeium")
spec(pon, "ai.gp")
spec(poff, "ai.chatgpt")
spec(poff, "ai.copilot")

--<< UI >>--

spec(poff, "ui.virt-column")
spec(pon, "ui.transparent") -- start dashboard
spec(pon, "ui.lualine") -- statusline
spec(pon, "ui.indentlines") -- show indent lines
spec(pon, "ui.illuminate")
spec(pon, "ui.fidget") -- cool LSP notification
spec(pon, "ui.dressing") -- offers better ui for some neovim commands
spec(pon, "ui.colorizer") -- color preview
spec(pon, "ui.bufferline")
spec(pon, "ui.barbecue") -- shows the current symbol and its parents
spec(pon, "ui.alpha") -- start dashboard
spec(poff, "ui.twilight")
spec(poff, "ui.sunglasses")
spec(poff, "ui.netrw")
spec(poff, "ui.headlines")

--<< Lualine integrations >>--

spec(pon, "ui.lualine.battery")
spec(pon, "ui.lualine.copilot")
spec(pon, "ui.lualine.clock")

-- Loads all with lazy

require("custom.lazy")
require("custom.highlight") -- required to be loaded after lazy

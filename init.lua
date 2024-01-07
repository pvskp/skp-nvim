require("custom")
require("custom.autocommands")
require("custom.globals")
require("custom.highlight")
require("custom.remap")
require("custom.set")
require("custom.utils")

---loads a plugin to lazy
---@param plugin_relative_path string the relative path to "custom.plugins" where the plugin config is located
local spec = function(plugin_relative_path)
	local plugins = "custom.plugins."
	Spec(plugins .. plugin_relative_path)
end

--<< colorschemes >>--
-- spec("colorscheme.rose-pine")
-- spec("colorscheme.vscode")
-- spec("colorscheme.catppuccin")
-- spec("colorscheme.onedark")
-- spec("colorscheme.everforest")
-- spec("colorscheme.moonlight")
-- spec("colorscheme.gruvbox-material")
spec("colorscheme.tokyonight")

--<< LSP related >>--

spec("lsp.conform") -- formatter
spec("lsp.lspconfig")
spec("lsp.mason") -- download lsp servers, fomratters, etc
spec("lsp.navbuddy") -- allow to navigate between symbols in a easir way
spec("lsp.nvim-lint") -- linting
spec("lsp.treesiter") -- love and hate relationship with this one

--<< General >>--

-- spec("oil")
-- spec("flybuf")
-- spec("illuminate")
-- spec("lab")
-- spec("neo-tree")
-- spec("neoscroll")
-- spec("netrw")
-- spec("nvim-tree")
-- spec("oil")
-- spec("twilight")

spec("alpha") -- start dashboard
spec("autopairs")
spec("barbecue") -- cool bar on top that shows the current symbol and its parents
spec("btterm") -- this one is mine!!!!
spec("chatgpt")
spec("cmp") -- completion
spec("colorizer") -- color preview
spec("commentary")
spec("copilot")
spec("copilot-lualine")
spec("discord") -- rich presence
spec("dressing") -- offers better ui for some neovim commands
spec("eyeliner") -- quick jump with f, F, t, T
spec("fidget") -- cool LSP notification
spec("focus") -- auto-resize windows when switching buffers
spec("hawtkeys") -- show best keybindings to be mapped
spec("hop") -- jump to any word in the screen
spec("indentlines") -- show indent lines
spec("lazygit") -- lazygit inside neovim
spec("lualine") -- statusline
spec("luasnip") -- snippets
spec("mini") -- minitree (best tree plugin)
spec("rainbow-delimiters") -- show matching delimiters
spec("surround") -- surround text with quotes, brackets, etc
spec("telescope") -- fuzzy finder
spec("tmux") -- tmux integration
spec("trouble") -- cool quickfix list for LSP
spec("ufo") -- deal with folding in a better way
spec("vim-go") -- go integration
spec("vim-kitty") -- kitty integration
spec("vim-kubectl") -- kubectl integration
-- spec("fugitive") -- git integration
spec("undotree") -- show undo tree
spec("gitsigns") -- show git signs on columnsign
spec("neodev") -- offers completion to neovim functions
spec("neogit")
spec("battery") -- show battery status

-- Loads all with lazy
require("custom.lazy")

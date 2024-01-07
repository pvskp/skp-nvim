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

spec("lsp.conform")
spec("lsp.lspconfig")
spec("lsp.mason")
spec("lsp.navbuddy")
spec("lsp.nvim-lint")
spec("lsp.treesiter")

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

spec("alpha")
spec("autopairs")
spec("barbecue")
spec("btterm")
spec("chatgpt")
spec("cmp")
spec("colorizer")
spec("commentary")
spec("copilot")
spec("copilot-lualine")
spec("discord")
spec("dressing")
spec("eyeliner")
spec("fidget")
spec("focus")
spec("hawtkeys")
spec("hop")
spec("indentlines")
spec("lazygit")
spec("lualine")
spec("luasnip")
spec("mini")
spec("rainbow-delimiters")
spec("surround")
spec("telescope")
spec("tmux")
spec("trouble")
spec("ufo")
spec("vim-go")
spec("vim-kitty")
spec("vim-kubectl")
spec("fugitive")
spec("undotree")
spec("gitsigns")
spec("neodev")

-- Loads all with lazy
require("custom.lazy")

require("custom")
require("custom.autocommands")
require("custom.globals")
require("custom.highlight")
require("custom.remap")
require("custom.set")
require("custom.utils")

---loads a plugin to lazy
---@param plugin_path string the relative path to "custom.plugins" where the plugin config is located
local spec = function(plugin_path)
	local plugins = "custom.plugins."
	Spec(plugins .. plugin_path)
end

--<< colorschemes >>--
-- spec("colorscheme.rose-pine")
spec("colorscheme.vscode")

--<< LSP related >>--

spec("lsp.conform")
spec("lsp.lspconfig")
spec("lsp.mason")
spec("lsp.navbuddy")
spec("lsp.nvim-lint")
spec("lsp.treesiter")

--<< General >>--

-- spec("flybuf")
-- spec("hawtkeys")
-- spec("illuminate")
-- spec("lab")
-- spec("neoscroll")
-- spec("netrw")

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
spec("focus")
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
spec("fidget")

-- Loads all with lazy
require("custom.lazy")

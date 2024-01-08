require("custom")
require("custom.autocommands")
require("custom.globals")
require("custom.remap")
require("custom.set")
require("custom.utils")

---loads a plugin to lazy
---@param plugin_relative_path string the relative path to "custom.plugins" where the plugin config is located
local spec = function(active, plugin_relative_path)
	if active == false then
		return
	end
	local plugins = "custom.plugins."
	Spec(plugins .. plugin_relative_path)
end

--<< colorschemes >>--
spec(pon, "colorscheme.adwaita")
spec(poff, "colorscheme.catppuccin")
spec(poff, "colorscheme.everforest")
spec(poff, "colorscheme.gruvbox-material")
spec(poff, "colorscheme.moonlight")
spec(poff, "colorscheme.onedark")
spec(poff, "colorscheme.rose-pine")
spec(poff, "colorscheme.tokyonight")
spec(poff, "colorscheme.vscode")

--<< LSP related >>--
spec(pon, "lsp.conform") -- formatter
spec(pon, "lsp.lspconfig")
spec(pon, "lsp.mason") -- download lsp servers, fomratters, etc
spec(pon, "lsp.navbuddy") -- allow to navigate between symbols in a easir way
spec(pon, "lsp.nvim-lint") -- linting
spec(pon, "lsp.cmp") -- completion
spec(pon, "lsp.treesiter") -- love and hate relationship with this one
spec(pon, "lsp.luasnip") -- snippets

--<< Language specific >>--
spec(pon, "languages.golang") -- go integration

--<< Mini library >>--
spec(pon, "mini.files") -- minitree (best tree plugin)
spec(pon, "mini.splitjoin") -- minitree (best tree plugin)

--<< Git integrations >>--
spec(pon, "git.neogit")
spec(pon, "git.lazygit") -- lazygit inside neovim
spec(poff, "git.fugitive") -- git integration
spec(pon, "git.gitsigns") -- show git signs on columnsign

--<< General >>--
spec(pon, "autopairs")
spec(pon, "btterm") -- this one is mine!!!!
spec(pon, "chatgpt")
spec(pon, "commentary")
spec(pon, "copilot")
spec(pon, "discord") -- rich presence
spec(pon, "eyeliner") -- quick jump with f, F, t, T
spec(pon, "focus") -- auto-resize windows when switching buffers
spec(pon, "hawtkeys") -- show best keybindings to be mapped
spec(pon, "hop") -- jump to any word in the screen
spec(pon, "rainbow-delimiters") -- show matching delimiters
spec(pon, "surround") -- surround text with quotes, brackets, etc
spec(pon, "telescope") -- fuzzy finder
spec(pon, "tmux") -- tmux integration
spec(pon, "trouble") -- cool quickfix list for LSP
spec(pon, "ufo") -- deal with folding in a better way
spec(pon, "kitty") -- kitty integration
spec(pon, "kubectl") -- kubectl integration
spec(pon, "undotree") -- show undo tree
spec(pon, "neodev") -- offers completion to neovim functions
spec(poff, "flybuf")
spec(poff, "illuminate")
spec(poff, "lab")
spec(poff, "neo-tree")
spec(poff, "neoscroll")
spec(poff, "nvim-tree")
spec(poff, "oil")

--<< UI >>--
spec(poff, "ui.netrw")
spec(poff, "ui.twilight")
spec(pon, "ui.alpha") -- start dashboard
spec(pon, "ui.barbecue") -- cool bar on top that shows the current symbol and its parents
spec(pon, "ui.colorizer") -- color preview
spec(pon, "ui.dressing") -- offers better ui for some neovim commands
spec(pon, "ui.fidget") -- cool LSP notification
spec(pon, "ui.indentlines") -- show indent lines
spec(pon, "ui.lualine") -- statusline
spec(pon, "ui.virt-column")

--<< Lualine integrations >>--
spec(pon, "ui.lualine.battery")
spec(pon, "ui.lualine.copilot")
spec(pon, "ui.lualine.clock")

-- Loads all with lazy
require("custom.lazy")
require("custom.highlight") -- required to be loaded after lazy

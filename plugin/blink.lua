require("utils")

vim.pack.add({
	{ src = Gh("saghen/blink.cmp"), version = vim.version.range("1.x") },
	Gh("rafamadriz/friendly-snippets"),
	Gh("pvskp/blink-cmp-fonts"),
})

require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
		["<CR>"] = { "accept", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward" },
		["<C-d>"] = {
			function(cmp)
				cmp.show({ providers = { "buffer" } })
			end,
		},
		["<C-f>"] = {
			function(cmp)
				-- keep the super-tab behavior of scrolling docs when the menu is open
				if cmp.is_menu_visible() then
					return false
				end
				cmp.show({ providers = { "fonts" } })
				return true
			end,
			"scroll_documentation_down",
			"fallback",
		},
		["<C-s>"] = {
			function(cmp)
				cmp.show()
			end,
		},
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
    trigger = {
      show_on_insert = false,
    },
		list = {
			selection = {
				preselect = false,
			},
		},
		ghost_text = {
			enabled = true,
		},
		menu = {
			draw = {
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			window = {
				border = "solid",
			},
		},
	},
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			vimwiki = { "buffer", "path" },
		},
		providers = {
      skills = {
        name = "Skills",
        module = "blink-cmp-skills",
        score_offset = 100,
      },
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
			fonts = {
				name = "Fonts",
				module = "blink-cmp-fonts",
				async = true,
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

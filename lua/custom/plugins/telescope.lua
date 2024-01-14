return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.5",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				mappings = {
					i = {
						["<Esc>"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				buffers = {
					-- theme = "dropdown",
					previewer = false,
					show_all_buffers = true,
					mappings = {
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<Esc>"] = require("telescope.actions").close,
							["<leader>e"] = require("telescope.actions").close,
						},
					},
					-- ignore_current_buffer = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		local dropdown_opts = {
			borderchars = {
				{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			width = 0.8,
			previewer = false,
			prompt_title = false,
		}

		local no_preview = function(prompt)
			if prompt ~= nil then
				dropdown_opts["prompt_title"] = prompt
			else
				dropdown_opts["prompt_title"] = false
			end

			return themes.get_dropdown(dropdown_opts)
		end

		vim.keymap.set("n", "<leader>f", function()
			builtin.find_files(no_preview("Find Files"))
		end, { desc = "Find [F]iles" })

		vim.keymap.set("n", "<leader>g", builtin.live_grep, {
			desc = "[G]rep Files",
		})

		vim.keymap.set("n", "<leader>b", function()
			builtin.buffers(no_preview("Buffers"))
		end, { desc = "List [B]uffers" })

		vim.keymap.set("n", "<leader>h", builtin.help_tags, {
			desc = "[H]elp Tags",
		})

		vim.keymap.set("n", "<leader>mp", builtin.man_pages, {
			desc = "[M]an [P]ages",
		})

		vim.keymap.set(
			"n",
			"<leader>bf",
			":Telescope current_buffer_fuzzy_find<CR>",
			{ silent = true, desc = "[B]uffer [F]uzzy" }
		)

		require("telescope").load_extension("ui-select")
	end,
}

return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},

				border = "single",
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true, -- not the same as ensure_installed
		})

		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }
		local set_keymaps = function(bufnr)
			opts.buffer = bufnr

			opts.desc = "Uses Navbuddy"
			keymap.set("n", "<leader>n", ":Navbuddy<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Go to references"
			keymap.set("n", "gr", vim.lsp.buf.references, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Formats code"
			keymap.set("n", "<leader>p", vim.lsp.buf.format, opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		local on_attach = function(_, bufnr)
			-- mapping to restart lsp if necessary
			set_keymaps(bufnr)

			-- vim.highlight.priorities.semantic_tokens = 95
			-- vim.highlight.priorities.treesitter = 201
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["lua_ls"] = function()
				require("lspconfig")["lua_ls"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = { -- custom settings for lua
						Lua = {
							-- make the language server recognize "vim" global
							hint = { enable = true },
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								-- make language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"beautysh",
				"black",
				"eslint_d",
				"flake8",
				"goimports",
				"golangci-lint",
				"gopls",
				"isort",
				"jsonlint",
				"lua_ls",
				"prettier",
				"pylint",
				"pyright",
				"stylua",
				"terraformls",
				"tflint",
				"tfsec",
				"yamlls",
			},
		})

		-- ["yamlls"] = function ()
		-- local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
		-- return not vim.tbl_isempty(check)
		-- end,

		-- identifies if a "Chart.yaml" is present in the current directory. If it's, stops yamlls and starts helm_ls
	end,
}

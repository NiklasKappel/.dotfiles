return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		require("mason").setup()

		local global_servers = {
			"bashls",
			"lua_ls",
			"prismals",
			"pyright",
			"ruff",
			"taplo",
			"texlab",
			"ts_ls",
		}

		local per_project_servers = {
			"biome",
		}

		require("mason-lspconfig").setup({ ensure_installed = global_servers })

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")

		local servers = vim.iter({
			global_servers,
			per_project_servers,
		})
			:flatten()
			:totable()

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths here.
							"${3rd}/luv/library",
							"${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		lspconfig.pyright.setup({
			settings = {
				pyright = {
					-- Disable organize imports command in favor of ruff.
					disableOrganizeImports = true,
				},
			},
		})

		lspconfig.ruff.setup({
			capabilities = capabilities,
			-- Disable linting in favor of Pyright.
			init_options = {
				settings = {
					lint = { enable = false },
				},
			},
		})

		lspconfig.texlab.setup({
			root_dir = util.root_pattern("main.tex", "latexmkrc", ".git"),
			settings = {
				texlab = {
					build = {
						args = {
							"-pdf",
							"-interaction=nonstopmode",
							"-synctex=0",
							"%f",
							"-auxdir=build",
						},
						onSave = true,
					},
					chktex = {
						onEdit = true,
						onOpenAndSave = true,
					},
				},
			},
		})
	end,
}

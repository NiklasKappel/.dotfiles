return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { lsp_format = "fallback", "prettier" },
				json = { lsp_format = "fallback", "prettier" },
				jsonc = { lsp_format = "fallback", "prettier" },
				lua = { "stylua" },
				prisma = { lsp_format = "prefer" },
				python = { lsp_format = "prefer" },
				toml = { lsp_format = "prefer" },
				typescript = { lsp_format = "fallback", "prettier" },
				typescriptreact = { lsp_format = "fallback", "prettier" },
				sh = { lsp_format = "prefer" },
				yaml = { lsp_format = "fallback", "prettier" },
			},
			format_on_save = { timeout_ms = 5000 },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				-- Globally installed formatters.
				-- Keep minimal, as they might conflict with project-specific formatters.
				"stylua",
			},
		},
	},
}

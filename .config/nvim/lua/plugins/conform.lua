return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { lsp_format = "prefer" },
			json = { lsp_format = "prefer" },
			jsonc = { lsp_format = "prefer" },
			lua = { "stylua" },
			python = { lsp_format = "prefer" },
			sh = { lsp_format = "prefer" },
			toml = { lsp_format = "prefer" },
			typescript = { lsp_format = "prefer" },
			typescriptreact = { lsp_format = "prefer" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}

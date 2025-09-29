return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			json5 = { "prettier" },
			jsonc = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff_fix", "ruff_organize_imports" },
			sh = { lsp_format = "prefer" },
			toml = { lsp_format = "prefer" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}

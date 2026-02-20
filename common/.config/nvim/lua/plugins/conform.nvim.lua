return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { lsp_format = "prefer" },
			-- web dev
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			json5 = { "prettier" },
			jsonc = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}

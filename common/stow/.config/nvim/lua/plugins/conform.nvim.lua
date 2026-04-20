return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { lsp_format = "prefer" },
			-- web dev
			css = { "prettier", "biome" },
			html = { "prettier", "biome" },
			javascript = { "prettier", "biome", "biome-organize-imports" },
			javascriptreact = { "prettier", "biome", "biome-organize-imports" },
			json = { "prettier", "biome" },
			json5 = { "prettier", "biome" },
			jsonc = { "prettier", "biome" },
			typescript = { "prettier", "biome", "biome-organize-imports" },
			typescriptreact = { "prettier", "biome", "biome-organize-imports" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}

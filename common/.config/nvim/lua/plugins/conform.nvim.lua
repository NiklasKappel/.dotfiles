return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { lsp_format = "prefer" },
			-- web dev
			css = { "biome" },
			html = { "biome" },
			javascript = { "biome", "biome-organize-imports" },
			javascriptreact = { "biome", "biome-organize-imports" },
			json = { "biome" },
			json5 = { "biome" },
			jsonc = { "biome" },
			typescript = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}

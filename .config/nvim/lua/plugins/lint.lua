return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			css = { "eslint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			json = { "eslint" },
			json5 = { "eslint" },
			jsonc = { "eslint" },
			markdown = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

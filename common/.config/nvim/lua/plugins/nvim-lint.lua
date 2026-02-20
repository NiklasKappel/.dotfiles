return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			-- web dev
			css = { "eslint" },
			html = { "eslint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			json = { "eslint" },
			json5 = { "eslint" },
			jsonc = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

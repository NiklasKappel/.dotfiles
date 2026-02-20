return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason.nvim", opts = {} },
	},
	opts = {
		ensure_installed = {
			-- Globally installed language servers, formatters, and linters.
			-- Keep minimal, as they might conflict with project-specific servers.

			-- language servers
			"angularls",
			"bashls",
			"lua_ls",
			"texlab",
			"ts_ls",

			-- formatters
			"stylua",

			-- linters
			"shellcheck", -- Run by bashls.
		},
	},
}

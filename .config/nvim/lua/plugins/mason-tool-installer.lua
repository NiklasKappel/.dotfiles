return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	opts = {
		ensure_installed = {
			-- Globally installed language servers.
			-- Keep minimal, as they might conflict with project-specific servers.
			"bashls",
			"lua_ls",
			"marksman",
			"texlab",

			-- Extended by formatter and linter plugins.
		},
	},
}

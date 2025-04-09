return {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip").config.setup({ enable_autosnippets = true })
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets/" })
	end,
}

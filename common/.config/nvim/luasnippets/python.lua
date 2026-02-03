local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		"main",
		fmta(
			[[
        def main():
            <>


        if __name__ == '__main__':
            main()
      ]],
			{ i(1) }
		)
	),
}

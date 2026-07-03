local ls = require("luasnip")
local f = ls.function_node
local i = ls.insert_node
local s = ls.snippet
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local get_guard_name = function()
	local file_name = vim.fn.expand("%:t:r")
	local guard_name = string.upper(file_name) .. "_H"
	return guard_name
end

return {
	s(
		"guard",
		fmta(
			[[
        #ifndef <>
        #define <>

        <>

        #endif
      ]],
			{ f(get_guard_name), f(get_guard_name), i(1) }
		)
	),
	s(
		"ns",
		fmta(
			[[
        namespace <> {

        <>

        }    // namespace <>
      ]],
			{ i(1), i(2), rep(1) }
		)
	),
}

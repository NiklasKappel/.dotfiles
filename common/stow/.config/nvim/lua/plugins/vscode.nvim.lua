return {
	"Mofiqul/vscode.nvim",
	opts = function()
		local c = require("vscode.colors").get_colors()
		return {
			group_overrides = {
				SpellBad = { fg = c.vscRed, undercurl = true, sp = c.vscRed },
				SpellCap = { fg = c.vscYellow, undercurl = true, sp = c.vscYellow },
				SpellLocal = { fg = c.vscBlue, undercurl = true, sp = c.vscBlue },
				SpellRare = { fg = c.vscViolet, undercurl = true, sp = c.vscViolet },
			},
		}
	end,
}

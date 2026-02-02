vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

-- Fixes vim not recognizing regions of files that should be spell-checked.
-- See: https://stackoverflow.com/a/39539203
vim.api.nvim_create_autocmd("Syntax", {
	buffer = 0,
	once = true,
	callback = function()
		vim.cmd("syntax spell toplevel")
	end,
})

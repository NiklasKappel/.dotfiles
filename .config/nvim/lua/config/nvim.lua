-- compatibility
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.opt.shell = "/bin/sh"

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- display
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- behavior
vim.g.tex_flavor = "latex"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- mouse menu
vim.api.nvim_exec2(
	[[
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-
  ]],
	{}
)

-- command completion
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"
vim.keymap.set("c", "<CR>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	end
	return "<CR>"
end, { expr = true })

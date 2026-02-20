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

-- colors
vim.cmd.colorscheme("vscode")

-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
})

-- lsp
vim.lsp.enable({
	"angularls",
	"basedpyright",
	"bashls",
	"lua_ls",
	"ruff",
	"texlab",
	"ts_ls",
})

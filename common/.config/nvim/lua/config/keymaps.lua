local fzf = require("fzf-lua")

require("which-key").add({
	-- navigate wraps
	{ "j", "gj", mode = { "n", "v" } },
	{ "k", "gk", mode = { "n", "v" } },

	-- navigate windows
	{ "<C-h>", "<C-w>h" },
	{ "<C-j>", "<C-w>j" },
	{ "<C-k>", "<C-w>k" },
	{ "<C-l>", "<C-w>l" },

	-- save buffer
	{ "<C-s>", "<Cmd>w<CR>" },
	{ "<C-s>", "<Cmd>w<CR><Esc>", mode = { "i" } },

	-- search and replace
	{ "<Leader>s", [[:let @/ = '\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>]], desc = "search word under cursor" },
	{ "<Leader>r", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], desc = "search and replace", silent = false },

	-- move selection
	{ "<C-k>", ":m '<-2<CR>gv=gv", mode = { "v" } },
	{ "<C-j>", ":m '>+1<CR>gv=gv", mode = { "v" } },
	{ ">", ">gv", mode = { "v" } },
	{ "<", "<gv", mode = { "v" } },

	-- toggle plugins
	{ "<Leader>e", vim.cmd.NvimTreeFindFileToggle, desc = "explorer" },
	{ "<Leader>q", "<cmd>Trouble diagnostics toggle<cr>", desc = "quickfix" },

	-- lookup (compare `:h K`)
	{ "K", vim.lsp.buf.hover, desc = "hover information" },

	-- goto (compare `:h gd`)
	{ "gD", fzf.lsp_declarations, desc = "goto declaration" },
	{ "gd", fzf.lsp_definitions, desc = "goto definition" },
	{ "gi", fzf.lsp_implementations, desc = "goto implementation" },
	{ "gr", fzf.lsp_references, desc = "goto references" },
	{ "gt", fzf.lsp_typedefs, desc = "goto type" },

	-- LSP
	{ "<Leader>l", group = "LSP" },
	{ "<Leader>ld", vim.diagnostic.open_float, desc = "diagnostics" },
	{ "<Leader>lr", vim.lsp.buf.rename, desc = "rename" },

	-- find
	{ "<Leader>f", group = "find" },
	{ "<Leader>f/", fzf.lgrep_curbuf, desc = "in buffer" },
	{ "<Leader>ff", fzf.files, desc = "files" },
	{ "<Leader>fg", fzf.live_grep_native, desc = "with grep" },
	{ "<Leader>fh", fzf.helptags, desc = "help" },
	{ "<Leader>fk", fzf.keymaps, desc = "keymaps" },
	{ "<Leader>fr", fzf.history, desc = "recent files" },
})

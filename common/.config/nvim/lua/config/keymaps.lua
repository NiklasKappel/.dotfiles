local fzf = require("fzf-lua")

local hover_line_diagnostics = function()
	local float = vim.diagnostic.config().float
	if float then
		local config = type(float) == "table" and float or {}
		config.scope = "line"
		vim.diagnostic.open_float(config)
	end
end

local toggle_diagnostics = function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

require("which-key").add({
	-- Navigate wraps.
	{ "j", "gj", mode = { "n", "v" } },
	{ "k", "gk", mode = { "n", "v" } },

	-- Navigate windows.
	{ "<C-h>", "<C-w>h" },
	{ "<C-j>", "<C-w>j" },
	{ "<C-k>", "<C-w>k" },
	{ "<C-l>", "<C-w>l" },

	-- Save buffer.
	{ "<C-s>", "<Cmd>w<CR>" },
	{ "<C-s>", "<Cmd>w<CR><Esc>", mode = { "i" } },

	-- Move selected text.
	{ "<C-k>", ":m '<-2<CR>gv=gv", mode = { "v" } },
	{ "<C-j>", ":m '>+1<CR>gv=gv", mode = { "v" } },
	{ ">", ">gv", mode = { "v" } },
	{ "<", "<gv", mode = { "v" } },

	-- Search and replace.
	{ "<Leader>s", [[:let @/ = '\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>]], desc = "search word under cursor" },
	{ "<Leader>r", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], desc = "search and replace", silent = false },

	-- Compare `:h K`.
	{ "K", vim.lsp.buf.hover, desc = "hover information" },
	-- Compare `:h gd`.
	{ "gd", fzf.lsp_definitions, desc = "goto definition" },
	{ "gD", fzf.lsp_declarations, desc = "goto declaration" },
	{ "gi", fzf.lsp_implementations, desc = "goto implementation" },
	{ "gt", fzf.lsp_typedefs, desc = "goto type" },

	{ "<Leader>f", group = "find" },
	{ "<Leader>f/", fzf.lgrep_curbuf, desc = "in buffer" },
	{ "<Leader>fb", fzf.buffers, desc = "buffers" },
	{ "<Leader>ff", fzf.files, desc = "files" },
	{ "<Leader>fg", fzf.live_grep_native, desc = "with grep" },
	{ "<Leader>fh", fzf.helptags, desc = "help" },
	{ "<Leader>fk", fzf.keymaps, desc = "keymaps" },
	{ "<Leader>fr", fzf.history, desc = "recent files" },
	{ "<Leader>fw", fzf.grep_cword, desc = "this word" },

	{ "<Leader>g", group = "goto" },
	{ "<Leader>gd", fzf.lsp_definitions, desc = "definition" },
	{ "<leader>gD", fzf.lsp_declarations, desc = "declaration" },
	{ "<Leader>gi", fzf.lsp_implementations, desc = "implementation" },
	{ "<Leader>gr", fzf.lsp_references, desc = "references" },
	{ "<Leader>gt", fzf.lsp_typedefs, desc = "type" },
	{ "<Leader>gc", group = "calls" },
	{ "<Leader>gci", fzf.lsp_incoming_calls, desc = "incoming" },
	{ "<Leader>gco", fzf.lsp_outgoing_calls, desc = "outgoing" },
	{ "<Leader>gs", group = "symbols" },
	{ "<Leader>gsd", fzf.lsp_document_symbols, desc = "document" },
	{ "<Leader>gsw", fzf.lsp_live_workspace_symbols, desc = "workspace" },

	{ "<Leader>h", group = "hover" },
	{ "<Leader>hd", hover_line_diagnostics, desc = "diagnostics" },
	{ "<Leader>hi", vim.lsp.buf.hover, desc = "information" },
	{ "<Leader>hs", vim.lsp.buf.signature_help, desc = "signature" },

	{ "<Leader>l", group = "LSP" },
	{ "<Leader>la", fzf.lsp_code_actions, desc = "code action" },
	{ "<Leader>ld", group = "diagnostics" },
	{ "<Leader>ldt", toggle_diagnostics, desc = "toggle" },
	{ "<Leader>ldd", fzf.diagnostics_document, desc = "document" },
	{ "<Leader>ldw", fzf.diagnostics_workspace, desc = "workspace" },
	{
		"<Leader>li",
		function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" } },
				apply = true,
			})
		end,
		desc = "organize imports",
	},
	{ "<Leader>lr", vim.lsp.buf.rename, desc = "rename" },

	{ "<Leader>e", vim.cmd.NvimTreeFindFileToggle, desc = "explorer" },
	{ "<Leader>q", "<cmd>Trouble diagnostics toggle<cr>", desc = "quickfix" },
})

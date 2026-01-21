local tb = require("telescope.builtin")

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
	{ "gd", tb.lsp_definitions, desc = "goto definition" },
	{ "gi", tb.lsp_implementations, desc = "goto implementation" },
	{ "gt", tb.lsp_type_definitions, desc = "goto type" },

	{ "<Leader>f", group = "find" },
	{ "<Leader>f/", tb.current_buffer_fuzzy_find, desc = "in buffer" },
	{ "<Leader>fb", tb.buffers, desc = "buffers" },
	{ "<Leader>ff", tb.find_files, desc = "files" },
	{ "<Leader>fg", tb.live_grep, desc = "with grep" },
	{ "<Leader>fh", tb.help_tags, desc = "help" },
	{ "<Leader>fk", tb.keymaps, desc = "keymaps" },
	{ "<Leader>fr", tb.oldfiles, desc = "recent files" },
	{ "<Leader>fw", tb.grep_string, desc = "this word" },

	{ "<Leader>g", group = "goto" },
	{ "<Leader>gd", tb.lsp_definitions, desc = "definition" },
	{ "<Leader>gD", tb.diagnostic, desc = "diagnostics" },
	{ "<Leader>gi", tb.lsp_implementations, desc = "implementation" },
	{ "<Leader>gr", tb.lsp_references, desc = "references" },
	{ "<Leader>gt", tb.lsp_type_definitions, desc = "type" },
	{ "<Leader>gc", group = "calls" },
	{ "<Leader>gci", tb.lsp_incoming_calls, desc = "incoming" },
	{ "<Leader>gco", tb.lsp_outgoing_calls, desc = "outgoing" },
	{ "<Leader>gs", group = "symbols" },
	{ "<Leader>gsd", tb.lsp_document_symbols, desc = "document" },
	{ "<Leader>gsw", tb.lsp_workspace_symbols, desc = "workspace" },

	{ "<Leader>h", group = "hover" },
	{ "<Leader>hd", hover_line_diagnostics, desc = "diagnostics" },
	{ "<Leader>hi", vim.lsp.buf.hover, desc = "information" },
	{ "<Leader>hs", vim.lsp.buf.signature_help, desc = "signature" },

	{ "<Leader>l", group = "LSP" },
	{ "<Leader>la", vim.lsp.buf.code_action, desc = "code action" },
	{ "<Leader>ld", toggle_diagnostics, desc = "toggle diagnostics" },
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

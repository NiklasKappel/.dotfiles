local luasnip = require("luasnip")
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

	-- { "<C-f>", luasnip.expand_or_jump, mode = { "i" }, desc = "expand snippet or jump" },
	-- {
	-- 	"<C-b>",
	-- 	function()
	-- 		luasnip.jump(-1)
	-- 	end,
	-- 	mode = { "i" },
	-- 	desc = "jump back",
	-- },
})

-- gp.nvim
-- require("which-key").add({
-- 	-- VISUAL mode mappings
-- 	-- s, x, v modes are handled the same way by which_key
-- 	{
-- 		mode = { "v" },
-- 		nowait = true,
-- 		remap = false,
-- 		{ "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "ChatNew tabnew" },
-- 		{ "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
-- 		{ "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
-- 		{ "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
-- 		{ "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)" },
-- 		{ "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
-- 		{ "<C-g>g", group = "generate into new .." },
-- 		{ "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
-- 		{ "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
-- 		{ "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
-- 		{ "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" },
-- 		{ "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
-- 		{ "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
-- 		{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
-- 		{ "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
-- 		{ "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
-- 		{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
-- 		{ "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
-- 		{ "<C-g>w", group = "Whisper" },
-- 		{ "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append" },
-- 		{ "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend" },
-- 		{ "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
-- 		{ "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
-- 		{ "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
-- 		{ "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite" },
-- 		{ "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
-- 		{ "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
-- 		{ "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
-- 		{ "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
-- 	},
--
-- 	-- NORMAL mode mappings
-- 	{
-- 		mode = { "n" },
-- 		nowait = true,
-- 		remap = false,
-- 		{ "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
-- 		{ "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
-- 		{ "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
-- 		{ "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
-- 		{ "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
-- 		{ "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
-- 		{ "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
-- 		{ "<C-g>g", group = "generate into new .." },
-- 		{ "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
-- 		{ "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
-- 		{ "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
-- 		{ "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
-- 		{ "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
-- 		{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
-- 		{ "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
-- 		{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
-- 		{ "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
-- 		{ "<C-g>w", group = "Whisper" },
-- 		{ "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
-- 		{ "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
-- 		{ "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
-- 		{ "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
-- 		{ "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
-- 		{ "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
-- 		{ "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
-- 		{ "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
-- 		{ "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
-- 		{ "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
-- 	},
--
-- 	-- INSERT mode mappings
-- 	{
-- 		mode = { "i" },
-- 		nowait = true,
-- 		remap = false,
-- 		{ "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
-- 		{ "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
-- 		{ "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
-- 		{ "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
-- 		{ "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
-- 		{ "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
-- 		{ "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
-- 		{ "<C-g>g", group = "generate into new .." },
-- 		{ "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
-- 		{ "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
-- 		{ "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
-- 		{ "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
-- 		{ "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
-- 		{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
-- 		{ "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
-- 		{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
-- 		{ "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
-- 		{ "<C-g>w", group = "Whisper" },
-- 		{ "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
-- 		{ "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
-- 		{ "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
-- 		{ "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
-- 		{ "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
-- 		{ "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
-- 		{ "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
-- 		{ "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
-- 		{ "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
-- 		{ "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
-- 	},
-- })

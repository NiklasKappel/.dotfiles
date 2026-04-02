return {
	"saghen/blink.cmp",
	-- Use a release tag to download pre-built binaries.
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		snippets = { preset = "luasnip" },

		-- Make cmdline's behavior match the default mode.
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = { auto_show = true },
			},
		},
	},
}

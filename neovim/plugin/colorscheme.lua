require("evergarden").setup({
	theme = {
		variant = "winter",
		accent = "snow",
	},
	editor = {
		transparent_background = true,
	},
	overrides = function(colors)
		return {
			SnacksIndent = { fg = colors.surface1 },
			SnacksIndentScope = { fg = colors.overlay0 },
		}
	end,
})

vim.cmd.colorscheme("evergarden")

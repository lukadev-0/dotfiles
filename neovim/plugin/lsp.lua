vim.lsp.enable({
	"astro",
	"denols",
	"lua_ls",
	"rust_analyzer",
	"tailwindcss",
	"ts_ls",
})

require("fidget").setup({
	progress = {
		display = {
			done_icon = "󰄬",
		},
	},
})

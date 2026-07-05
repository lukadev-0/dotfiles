vim.lsp.enable({
	"astro",
	"denols",
	"lua_ls",
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

-- Luau
local rojo_project = vim.fs.root(0, function(name)
	return name:match(".+%.project%.json$")
end)

require("luau-lsp").setup({
	platform = {
		type = rojo_project and "roblox" or "standard",
	},
	sourcemap = {
		enabled = rojo_project ~= nil,
	},
	fflags = {
		enable_new_solver = true,
	},
})

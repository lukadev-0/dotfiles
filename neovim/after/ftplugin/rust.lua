vim.opt_local.tabstop = 4

-- disable autopairs for ' in rust since they're used in lifetimes
vim.keymap.set("i", "'", "'", { buffer = true })

require("nvim-treesitter").install({ "rust" }):await(function()
	vim.treesitter.start()
end)

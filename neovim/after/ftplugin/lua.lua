vim.opt_local.tabstop = 4
vim.opt_local.expandtab = false

require("nvim-treesitter").install({ "lua" }):await(function()
	vim.treesitter.start()
end)

require("lazydev").setup()

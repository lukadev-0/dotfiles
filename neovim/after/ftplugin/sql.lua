vim.opt_local.tabstop = 4

require("nvim-treesitter").install({ "sql" }):await(function()
	vim.treesitter.start()
end)

require("nvim-treesitter").install({ "bash" }):await(function()
	vim.treesitter.start()
end)

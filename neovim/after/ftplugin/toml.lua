require("nvim-treesitter").install({ "toml" }):await(function()
	vim.treesitter.start()
end)

require("nvim-treesitter").install({ "astro", "typescript", "javascript" }):await(function()
	vim.treesitter.start()
end)

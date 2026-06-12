require("nvim-treesitter").install({ "nix" }):await(function()
	vim.treesitter.start()
end)

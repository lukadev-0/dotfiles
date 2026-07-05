local M = {}

--- @param langs string[]
function M.ensure(langs)
	local bufnr = vim.api.nvim_get_current_buf()
	require("nvim-treesitter").install(langs):await(function()
		if vim.api.nvim_buf_is_valid(bufnr) then
			vim.treesitter.start(bufnr)
		end
	end)
end

return M

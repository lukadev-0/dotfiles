local snacks = require("snacks")

snacks.setup({
	picker = {
		enabled = true,
		layout = { preset = "ivy" },
	},
	notifier = { enabled = true },
	indent = { enabled = true },
	gitbrowse = { enabled = true },
})

vim.keymap.set("n", "<leader><space>", snacks.picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>/", snacks.picker.grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>n", snacks.picker.notifications, { desc = "Notification History" })
vim.keymap.set("n", "<leader>fr", snacks.picker.recent, { desc = "Find recent" })
vim.keymap.set("n", "<leader>fc", function()
	snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>fh", snacks.picker.help, { desc = "Help pages" })
vim.keymap.set("n", "<leader>fs", snacks.picker.lsp_workspace_symbols, { desc = "Workspace symbols" })

vim.keymap.set("n", "<leader>gb", snacks.gitbrowse.open, { desc = "Open in browser (Git)" })

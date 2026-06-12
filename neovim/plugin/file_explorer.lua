local oil = require("oil")

vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>bc", function()
	oil.open(vim.fn.stdpath("config"))
end, { desc = "Browse Config" })

oil.setup()

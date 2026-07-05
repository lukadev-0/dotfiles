vim.opt_local.tabstop = 4

-- disable autopairs for ' in rust since they're used in lifetimes
vim.keymap.set("i", "'", "'", { buffer = true })

vim.keymap.set("n", "K", "<Cmd>RustLsp hover actions<CR>", { silent = true, buffer = true })

require("config.treesitter").ensure({ "rust" })

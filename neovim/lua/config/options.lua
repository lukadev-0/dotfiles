vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.pumblend = 5
vim.opt.winblend = 5

vim.o.foldtext = ""
vim.o.fillchars = "fold: "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        vim.cmd("normal zR")
    end,
})

if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_trail_size = 0.2
end

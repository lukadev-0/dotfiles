-- disable autopairs for ' in rust since they're used in lifetimes
vim.keymap.set("i", "'", "'", { buffer = true })

-- Rustaceanvim
local bufnr = vim.api.nvim_get_current_buf()

local function map(keys, fn, desc)
    vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: " .. desc })
end

map("<leader>ca>", function()
    vim.cmd.RustLsp("codeAction")
end, "Code Action")

map("K", function()
    vim.cmd.RustLsp({ "hover", "actions" })
end, "Code Action")

map("<leader>cr", vim.lsp.buf.rename, "Rename")
map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
map("gd", Snacks.picker.lsp_definitions, "Goto Definition")
map("gr", Snacks.picker.lsp_references, "Goto References")

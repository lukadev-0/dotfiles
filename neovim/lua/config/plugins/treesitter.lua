return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    if pcall(vim.treesitter.start) then
                        vim.wo.foldmethod = "expr"
                        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}

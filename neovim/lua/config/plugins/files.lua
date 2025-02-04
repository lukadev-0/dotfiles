return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        keys = {
            { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" },
        },
        opts = {
            win_options = {
                signcolumn = "yes",
            },
        },
    },
}

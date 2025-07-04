return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        keys = {
            { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" },
            {
                "<leader>bc",
                function()
                    require("oil").open(vim.fn.stdpath("config"))
                end,
                desc = "Browse config",
            },
        },
        opts = {
            win_options = {
                signcolumn = "yes",
            },
        },
    },
}

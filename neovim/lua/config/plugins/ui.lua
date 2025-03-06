return {
    {
        "echasnovski/mini.statusline",
        opts = {},
    },
    {
        "echasnovski/mini.icons",
        opts = {
            default = {
                directory = {
                    hl = "MiniIconsBlue",
                },
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        -- stylua: ignore
        keys = {
            { "<leader><space>", function() Snacks.picker.files() end, desc = "Find files" },
            { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>fh", function() Snacks.picker.help() end, desc = "Find help" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files" },
            { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
            { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" }
        },
        opts = {
            input = { enabled = true },
            indent = { enabled = true },
            statuscolumn = { enabled = true },
            notifier = { enabled = true },
            explorer = { enabled = true },
            picker = {
                enabled = true,
                sources = {
                    explorer = {
                        auto_close = true,
                        layout = {
                            preset = "sidebar",
                            layout = { position = "right" },
                        },
                    },
                },
            },
        },
    },
}

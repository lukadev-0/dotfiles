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
            { "<leader>fh", function() Snacks.picker.help() end, desc = "Telescope find help" },
        },
        opts = {
            input = { enabled = true },
            picker = { enabled = true },
            indent = { enabled = true },
            statuscolumn = { enabled = true },
            notifier = { enabled = true },
        },
    },
}

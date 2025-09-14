return {
    {
        "nvim-mini/mini.statusline",
        opts = {},
    },
    {
        "nvim-mini/mini.icons",
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
            { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },

            -- Git
            { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },

            -- LSP
            { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "<leader>ss", function() require("aerial").snacks_picker() end, desc = "Search Symbols" },
            { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Search Symbols (Workspace)" },
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
                layout = {
                    preset = "ivy",
                },
            },
        },
    },
    {
        "stevearc/aerial.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>so", "<cmd>AerialToggle<cr>", desc = "Symbol Outline" },
        },
        opts = {
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            layout = {
                width = 25,
            },
        },
    },
}

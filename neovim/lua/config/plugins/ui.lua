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
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    on_open = function(win)
                        vim.api.nvim_set_option_value("winblend", 0, { win = win })
                    end,
                },
            },
        },
        opts = {
            views = {
                mini = {
                    win_options = {
                        winblend = 0,
                    },
                },
                cmdline_popup = {
                    win_options = {
                        winblend = 0,
                    },
                },
                notify = {
                    win_options = {
                        winblend = 0,
                    },
                },
            },
            lsp = {
                signature = {
                    enabled = false,
                },
            },
            format = {
                lsp_progress_done = {
                    { "󰄬 ", hl_group = "NoiceLspProgressSpinner" },
                    { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                    { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                },
            },
        },
    },
}

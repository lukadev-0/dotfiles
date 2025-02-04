return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                no_italic = true,
                custom_highlights = function(colors)
                    return {
                        MiniStatuslineDevinfo = { fg = colors.subtext1, bg = colors.surface0 },
                        MiniStatuslineFileinfo = { fg = colors.subtext1, bg = colors.surface0 },
                        SnacksIndent = { fg = colors.surface0 },
                        SnacksIndentScope = { fg = colors.surface2 },
                        BlinkCmpDocSeparator = { fg = colors.surface1 },
                    }
                end,
                integrations = {
                    blink_cmp = true,
                    fidget = true,
                    mason = true,
                    noice = true,
                    notify = true,
                    snacks = true,
                    which_key = true,
                },
            })

            vim.cmd([[colorscheme catppuccin]])

            -- Highlights horizontal rulers in rendered markdown in LSP hover docs.
            vim.api.nvim_create_autocmd("BufWinEnter", {
                pattern = "*",
                callback = function()
                    if vim.bo.filetype == "markdown" then
                        vim.fn.matchadd("WinSeparator", "^─\\+$")
                    end
                end,
            })
        end,
    },
}

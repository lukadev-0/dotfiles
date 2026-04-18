return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = not vim.g.neovide,
                float = {
                    transparent = false,
                    solid = false,
                },
                no_italic = true,
                custom_highlights = function(colors)
                    return {
                        MiniStatuslineDevinfo = { fg = colors.subtext1, bg = colors.surface0 },
                        MiniStatuslineFileinfo = { fg = colors.subtext1, bg = colors.surface0 },
                        SnacksPicker = { fg = colors.text, bg = colors.none },
                        SnacksPickerBorder = { fg = colors.blue, bg = colors.none },
                        SnacksPickerInput = { link = "SnacksPicker" },
                        SnacksPickerTitle = { link = "SnacksPicker" },
                        BlinkCmpDocSeparator = { fg = colors.surface1 },
                    }
                end,
                integrations = {
                    aerial = true,
                    blink_cmp = true,
                    fidget = true,
                    mason = true,
                    noice = true,
                    notify = true,
                    snacks = {
                        enabled = true,
                        indent_scope_color = "surface2",
                    },
                    which_key = true,
                },
            })

            vim.cmd([[colorscheme catppuccin-nvim]])

            if vim.g.neovide then
                vim.g.neovide_title_background_color =
                    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
            end
        end,
    },
}

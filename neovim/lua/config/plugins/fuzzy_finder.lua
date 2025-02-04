local function telescope_builtin(name)
    return function()
        require("telescope.builtin")[name]()
    end
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader><leader>", telescope_builtin("find_files"), desc = "Telescope find files" },
            { "<leader>fh", telescope_builtin("help_tags"), desc = "Telescope find help" },
        },
        cmd = "Telescope",
        config = function()
            require("telescope").setup({
                defaults = {
                    winblend = 0,
                },
                extensions = {
                    fzf = {},
                },
            })
            require("telescope").load_extension("fzf")
        end,
    },
}

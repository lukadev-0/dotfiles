return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
            {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        opts = {
            servers = {
                lua_ls = {},
            },
            custom = {
                {
                    setup = function(config)
                        require("typescript-tools").setup(config)
                    end,
                    config = {},
                },
            },
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup()

            local lspconfig = require("lspconfig")

            local function on_attach(_, buf)
                local function map(keys, fn, desc)
                    vim.keymap.set("n", keys, fn, { buffer = buf, desc = "LSP: " .. desc })
                end

                map("<leader>cr", vim.lsp.buf.rename, "Rename")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("gd", Snacks.picker.lsp_definitions, "Goto Definition")
                map("gr", Snacks.picker.lsp_references, "Goto References")
            end

            local function extend_config(config)
                return vim.tbl_extend("force", config, {
                    capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities),
                    on_attach = on_attach,
                })
            end

            for server, config in pairs(opts.servers) do
                lspconfig[server].setup(extend_config(config))
            end

            for _, custom in pairs(opts.custom) do
                custom.setup(extend_config(custom.config))
            end
        end,
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            signature = {
                enabled = true,
            },
        },
    },

    -- Lua
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
            },
        },
    },

    -- Rust
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
    },
}

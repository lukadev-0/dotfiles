return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "saghen/blink.cmp",
            {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
            {
                "lopi-py/luau-lsp.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
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
                {
                    setup = function(config)
                        local function rojo_project()
                            return vim.fs.root(0, function(name)
                                return name:match(".+%.project%.json$")
                            end)
                        end

                        require("luau-lsp").setup({
                            server = config,
                            platform = {
                                type = rojo_project() and "roblox" or "standard",
                            },
                            sourcemap = {
                                enabled = rojo_project() ~= nil,
                            },
                        })
                    end,
                    config = {},
                },
            },
        },
        config = function(_, opts)
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
    {
        "j-hui/fidget.nvim",
        opts = {
            progress = {
                display = {
                    done_icon = "󰄬",
                },
            },
            notification = {
                window = {
                    winblend = 0,
                },
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

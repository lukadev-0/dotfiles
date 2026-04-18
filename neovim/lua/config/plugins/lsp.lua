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
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local function map(keys, fn, desc)
                        vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
                    end

                    map("<leader>cr", vim.lsp.buf.rename, "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                end,
            })

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.enable({
                "astro",
                "denols",
                "gopls",
                "jsonls",
                "lua_ls",
                "qmlls",
                "svelte",
                -- "ts_ls",
            })
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
    -- FIXME: the window ain't transparent
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

    -- Luau
    {
        "lopi-py/luau-lsp.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local function rojo_project()
                return vim.fs.root(0, function(name)
                    return name:match(".+%.project%.json$")
                end)
            end

            require("luau-lsp").setup({
                platform = {
                    type = rojo_project() and "roblox" or "standard",
                },
                sourcemap = {
                    enabled = rojo_project() ~= nil,
                },
                fflags = {
                    enable_new_solver = true,
                },
            })
        end,
    },

    -- Rust
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
    },
}

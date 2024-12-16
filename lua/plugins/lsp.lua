return {
    { "williamboman/mason.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "eslint",
                    "clangd",
                    "pyright",
                    "html",
                    "cssls",
                }
            })
        end
    },
    { "rafamadriz/friendly-snippets" },
    { "hrsh7th/nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "mfussenegger/nvim-jdtls" },
    { "leafOfTree/vim-svelte-plugin" },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")

            ls.config.set_config({
                updateevents = "TextChanged, TextChangedI",
                enable_autosnippets = true
            })

            ls.filetype_extend('javascript', { 'javascriptreact' })
            ls.filetype_extend('javascript', { 'html' })
            ls.filetype_extend('javascriptreact', { 'javascript' })
            ls.filetype_extend('javascriptreact', { 'html' })
            ls.filetype_extend('handlebars', { 'html' })
            ls.filetype_extend('svelte', { 'javascript' })
            ls.filetype_extend('php', { 'html' })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(_, _)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
            end

            require("lspconfig").lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        disableSuggestions = true
                    }
                }
            })

            require("lspconfig").eslint.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").intelephense.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "clangd", "--fallback-style=webkit" },
                filetypes = { "c", "h", "cpp", "objc", "objcpp" },
                root_dir = function(fname)
                    return require 'lspconfig'.util.root_pattern('compile_flags.txt')(fname) or vim.loop.cwd()
                end,
            })

            require("lspconfig").pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").html.setup({
                on_attach = on_attach,
                settings = {
                    css = {
                        lint = {
                            validProperties = {},
                        },
                    },
                },
                capabilities = capabilities
            })

            require("lspconfig").cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").svelte.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            require("lspconfig").jdtls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })
        end
    },
    {
        "onsails/lspkind-nvim",
        config = function()
            local cmp = require("cmp")
            local lspkind = require('lspkind')
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                    })
                },
            })
        end
    },
}

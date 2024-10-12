require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "clangd",
        "pyright",
        "html",
        "cssls",
    }
})

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

require("lspconfig").tsserver.setup({
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

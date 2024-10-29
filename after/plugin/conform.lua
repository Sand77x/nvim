require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters = {
        prettier = {
            command = "C:/nvim-formatters/prettier.cmd"
        }
    }
})

return {
    { "mattn/emmet-vim" },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup(
                {
                    'css',
                    'html',
                    'js',
                },
                {
                    RGB = true,          -- #RGB hex codes
                    RRGGBB = true,       -- #RRGGBB hex codes
                    names = true,        -- "Name" codes like Blue
                    RRGGBBAA = true,     -- #RRGGBBAA hex codes
                    rgb_fn = true,       -- CSS rgb() and rgba() functions
                    hsl_fn = true,       -- CSS hsl() and hsla() functions
                    css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    mode = 'background', -- Set the display mode.
                })
        end
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                },
                formatters = {
                    prettier = {
                        command = "C:/nvim-formatters/prettier.cmd"
                    },
                }
            })
        end
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "luadoc", "markdown" },
                highlight = {
                    enable = true,
                },
            }
        end
    },

}

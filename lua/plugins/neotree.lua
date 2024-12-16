return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                sources = {
                    "filesystem",
                    "document_symbols"
                },
                filesystem = {
                    window = {
                        position = "right",
                        mappings = {
                            ["-"] = "navigate_up",
                        }
                    },
                    follow_current_file = {
                        enabled = true
                    }
                }
            })
        end
    },
}

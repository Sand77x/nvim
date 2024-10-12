local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },
    "eandrju/cellular-automaton.nvim",
    "lunarvim/Onedarker.nvim",
    "rafamadriz/friendly-snippets",
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind-nvim",
    "rhysd/conflict-marker.vim",
    "sindrets/diffview.nvim",
    "mattn/emmet-vim",
    {
        'jinh0/eyeliner.nvim',
        config = function()
            require 'eyeliner'.setup {
                highlight_on_key = true,
                dim = true
            }
        end
    },
    "nvim-lua/plenary.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    -- {
    --     "echasnovski/mini.files",
    --     version = false
    -- },
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
                    }
                }
            })
        end
    },
    "norcalli/nvim-colorizer.lua",
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    "nvim-tree/nvim-web-devicons",
    {
        "olivercederborg/poimandres.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                bold_vert_split = true,           -- use bold vertical separators
                dim_nc_background = true,         -- dim 'non-current' window backgrounds
                disable_background = false,       -- disable background
                disable_float_background = false, -- disable background for floats
                disable_italics = false,          -- disable italics
            }
        end,
    },
    "wellle/targets.vim",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require('todo-comments').setup()
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end
    },
    "mbbill/undotree",
    "ThePrimeagen/vim-be-good",
    "tpope/vim-fugitive",
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("themes.alpha-config")
        end
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            }
        },
    },
    "ggandor/leap.nvim",
    "tpope/vim-commentary",
    "nvim-pack/nvim-spectre",
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic'.load()
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    "mfussenegger/nvim-jdtls",
    "leafOfTree/vim-svelte-plugin",
    'sam4llis/nvim-tundra',
}

local opts = {}

require("lazy").setup(plugins, opts)

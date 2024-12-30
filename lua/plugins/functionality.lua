return {
	{ "tpope/vim-commentary" },
	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_DiffpanelHeight = 15
			vim.g.undotree_WindowLayout = 2
		end,
	},
	{ "wellle/targets.vim" },
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap").opts

			leap.safe_labels = ""
			leap.labels = "abcdefghijklmnopqrstuvwxyz"
			leap.special_keys = {
				next_target = "",
				prev_target = "",
				next_group = "<Enter>",
				prev_group = "<S-Enter>",
			}
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
}

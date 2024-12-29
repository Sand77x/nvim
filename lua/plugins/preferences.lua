return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local custom = require("lualine.themes.poimandres")

			custom.normal.a.bg = "#a3f7d0"
			-- custom.insert.a.bg =
			custom.replace.a.bg = "#f7a3ac"
			custom.visual.a.bg = "#dfa3f0"
			custom.command.a.bg = "#fffdfa"

			require("lualine").setup({
				options = {
					disabled_filetypes = { "neo-tree" },
					theme = custom,
					-- component_separators = { left = '', right = ''},
					-- section_separators = { left = '', right = ','},
					component_separators = { left = "", right = "/" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_x = { "filetype", "encoding" },
					lualine_y = { "location" },
					lualine_z = {},
				},
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({
				excluded_filetypes = {
					"nofile",
					"neo-tree",
					"neo-tree filesystem",
					"dropbar_menu",
					"dropbar_menu_fzf",
					"DressingInput",
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
				},
			})
		end,
	},
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
	},
}

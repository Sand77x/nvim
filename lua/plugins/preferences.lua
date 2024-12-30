local function cmp_status()
	local enabled = require("misc.cmp").is_cmp_enabled()
	if not enabled then
		return [[--- CMP DISABLED ---]]
	else
		return ""
	end
end

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
					disabled_filetypes = { "neo-tree", "fugitive" },
					theme = custom,
					-- component_separators = { left = '', right = ''},
					-- section_separators = { left = '', right = ','},
					component_separators = { left = "   ", right = "/" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename", cmp_status },
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
					"fugitive",
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
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 30,
				width = 120,
				height = 1,
				options = {
					-- signcolumn = "no", -- disable signcolumn
					-- number = false, -- disable number column
					-- relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					-- cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
		},
	},
}

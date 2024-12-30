return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	build = "cargo build --release",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-n>"] = { "show", "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
		},

		completion = {
			list = {
				selection = "manual",
			},
			menu = {
				auto_show = false,
			},
			ghost_text = {
				enabled = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				update_delay_ms = 500,
				window = {
					min_width = 10,
					max_width = 80,
					max_height = 20,
					border = "padded",
					winblend = 0,
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					scrollbar = true,
					direction_priority = {
						menu_north = { "e", "w", "n", "s" },
						menu_south = { "e", "w", "s", "n" },
					},
				},
			},
		},

		-- REALLY COOL, but until it has a way to be manually enabled,
		-- i dont really want to use it
		-- signature = {
		-- 	enabled = true,
		-- },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		enabled = function()
			return not vim.tbl_contains({ "txt", "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
	},
	opts_extend = { "sources.default" },
	fuzzy = {
		prebuilt_binaries = {
			download = true,
		},
	},
}

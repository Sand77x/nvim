local custom = require'lualine.themes.poimandres'

custom.normal.a.bg = "#a3f7d0"
-- custom.insert.a.bg = 
custom.replace.a.bg = "#f7a3ac"
custom.visual.a.bg = "#dfa3f0"
custom.command.a.bg = "#fffdfa"

local harpoon2 = {
    "harpoon2",
    icon = '',
    indicators = { " j", " k", " l", " ;" },
    active_indicators = { "󱦰j", "󱦰k", "󱦰l", "󱦰;" },
    separator = " ",
}

require('lualine').setup {
    options = {
        disabled_filetypes = { "alpha" },
        theme = custom,
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ','},
        component_separators = { left = '', right = '/'},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch' },
        lualine_c = { harpoon2, '%=', 'filename','diagnostics' },
        lualine_x = { 'filetype', 'encoding'},
        lualine_y = {'location'},
        lualine_z = {}
    }
}

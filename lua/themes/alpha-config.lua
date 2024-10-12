local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'
-- Set header
dashboard.section.header.val = {
    " ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓",
    " ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
    "▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░",
    "▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ",
    "▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒",
    "░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░",
    " ░     ░     ░ ░    ░     ░      ░",
}
dashboard.section.buttons.val = {
    dashboard.button('e', '    Edit Neovim', ':cd ~\\AppData\\Local\\nvim\\<CR>:Telescope find_files<CR>'),
    dashboard.button('q', '    Quit', ':q<CR>'),
}
dashboard.section.footer.val = {
    "~ " .. vim.loop.cwd() .. " ~",
}

alpha.setup(dashboard.opts)

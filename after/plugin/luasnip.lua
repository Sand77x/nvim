local ls = require("luasnip")

ls.config.set_config({
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true
})

ls.filetype_extend('javascript', { 'javascriptreact' })
ls.filetype_extend('javascript', { 'html' })
ls.filetype_extend('javascriptreact', { 'javascript' })
ls.filetype_extend('javascriptreact', { 'html' })
ls.filetype_extend('handlebars', { 'html' })
ls.filetype_extend('svelte', { 'javascript' })
ls.filetype_extend('php', { 'html' })

vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set("n", "<leader>lss", ":edit ~/Appdata/Local/nvim/after/plugin/luasnip.lua<CR>")

local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("lua",
    {
        s("lr", fmt("local {} = require('{}')",
            { i(1), rep(1) })),

        s("keymap", fmt('vim.keymap.set("{}", "{}", "{}")',
            { i(1, "n"), i(2, ""), i(3) }))
    })

ls.add_snippets("json",
    {
        s(",", fmt('"{}": "{}",',
            { i(1, "field"), i(2, "value") }))
    })

ls.add_snippets("javascript",
    {
        s("get", fmt([[
    {}.get("/{}", (req, res) => {{
        {}
    }})
    ]],
            { i(1), i(2), i(3) })),

        s("post", fmt([[
    {}.post("/{}", (req, res) => {{
        {}
    }})
    ]],
            { i(1), i(2), i(3) })),

        s("$", fmt([[
    ${{{}}}
    ]],
            { i(1) }))
    })

ls.add_snippets("css",
    {
        s("flexdef", fmt([[
    display: flex;
    flex-direction: {};
    justify-content: {};
    align-items: {};
    ]],
            { i(1, "row"), i(2, "center"), i(3, "center") })),
    })

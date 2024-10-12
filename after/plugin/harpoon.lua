local harpoon = require("harpoon")
harpoon:setup()

local function replace(index)
    local rel_path = vim.fn.expand('%')
    local length = harpoon:list():length()

    if index <= length then
        local replaced = harpoon:list()['items'][index].value

        for i, val in ipairs(harpoon:list()['items']) do
            if val.value == rel_path then
                harpoon:list()['items'][i].value = replaced
                break
            end
        end

        harpoon:list()['items'][index].value = rel_path
    else
        harpoon:list():add()
    end
end

vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

local keys = { "j", "k", "l", ";" }

for i, key in ipairs(keys) do
    vim.keymap.set("n", "s" .. key, function() harpoon:list():select(i) end)
    vim.keymap.set("n", "S" .. key, function() replace(i) end)
end

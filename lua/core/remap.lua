-- leader
vim.g.mapleader = " "

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better 0 remap
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- zz remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland (system paste)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- no copy on delete (except d)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>p", "p")
vim.keymap.set("v", "<leader>P", "P")
vim.keymap.set("v", "p", [["_dp]])
vim.keymap.set("v", "P", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>c", "c")
vim.keymap.set({ "n", "v" }, "<leader>C", "C")
vim.keymap.set({ "n", "v" }, "c", [["_c]])
vim.keymap.set({ "n", "v" }, "C", [["_C]])
vim.keymap.set({ "n", "v" }, "<leader>x", "x")
vim.keymap.set({ "n", "v" }, "<leader>X", "X")
vim.keymap.set({ "n", "v" }, "x", [["_x]])
vim.keymap.set({ "n", "v" }, "X", [["_X]])

-- remove maps
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "S", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- switching qf and loclists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- file sourcing maps
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- lsp remaps
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, vim.opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, vim.opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, vim.opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, vim.opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, vim.opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, vim.opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, vim.opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, vim.opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, vim.opts)
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

-- autoclose remaps (fucken amazing)
vim.keymap.set("i", "\"<tab>", "\"\"<Left>")
vim.keymap.set("i", "'<tab>", "''<Left>")
vim.keymap.set("i", "(<tab>", "()<Left>")
vim.keymap.set("i", "<<tab>", "<><Left>")
vim.keymap.set("i", "><tab>", "</><Left>")
vim.keymap.set("i", "[<tab>", "[]<Left>")
vim.keymap.set("i", "{<tab>", "{}<Left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O")

-- splits remaps
-- vim.keymap.set("n", "<leader><tab>", "<C-w><C-w>");
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-l>", "<C-w>l");
vim.keymap.set("n", "<C-j>", "<C-w>j");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")
vim.keymap.set("n", "<leader>vh", ":split<CR>")
vim.keymap.set("n", "<leader>vo", ":only<CR>")
vim.keymap.set("n", "<A-j>", "3<C-w><")
vim.keymap.set("n", "<A-k>", "3<C-w>>")

-- changing working dir
vim.keymap.set("n", "<leader>cdh", ":cd %:h<CR>:cd<CR>")

-- fugitive git
vim.keymap.set("n", "<leader>gs", ":G<CR><C-w>H:vertical resize 40<CR>");

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- remap "go to next instance" binds
vim.keymap.set("n", "(", "*")
vim.keymap.set("n", ")", "#")

-- trouble and todo remaps
vim.keymap.set("n", "<leader>tt", function() vim.cmd("TroubleToggle document_diagnostics") end)
vim.keymap.set("n", "<leader>pt", function() vim.cmd("TodoTelescope") end)

-- minifiles
-- vim.keymap.set("n", "<leader>pv", function() vim.cmd(":lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)") end)

-- neotree
vim.keymap.set("n", "<leader>pv", function() vim.cmd(":Neotree toggle position=right") end)
vim.keymap.set("n", "<leader>pd", function() vim.cmd(":Neotree document_symbols toggle position=right") end)

-- splits resize
vim.keymap.set('n', '<A-h>', '<C-w>3<')
vim.keymap.set('n', '<A-l>', '<C-w>3>')
vim.keymap.set('n', '<A-j>', '<C-w>3-')
vim.keymap.set('n', '<A-k>', '<C-w>3+')

-- spectre remaps
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").toggle()<CR>')
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search()<CR>')

-- enable format on save for these filetypes
local fts = { "*.js", "*.html", "*.css", "*.scss", "*.lua", "*.py" }

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = fts,
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- add quit keymap for vim-fugitive
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	callback = function(args)
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<Esc>", ":quit<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>gs", ":quit<CR>", { silent = true })
	end,
})

-- add enter keymap for cmd-window
vim.api.nvim_create_autocmd("CmdwinEnter", {
	pattern = "*",
	callback = function(args)
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<CR>", "<CR>", {})
		vim.api.nvim_buf_set_keymap(args.buf, "v", "<CR>", "<CR>", {})
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<Esc>", ":q<CR>", { silent = true })
	end,
})

-- add close and goto keymap for help pages
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function(args)
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<Esc>", ":quit<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(args.buf, "n", "gd", "<C-]>", { silent = true })
	end,
})

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
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<Esc>", ":quit<CR>", {})
		vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>gs", ":quit<CR>", {})
	end,
})

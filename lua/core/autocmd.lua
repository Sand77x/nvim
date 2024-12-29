local fts = { "*.js", "*.html", "*.css", "*.scss", "*.lua", "*.py" }

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = fts,
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

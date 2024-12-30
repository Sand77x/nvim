vim.api.nvim_create_user_command("CFG", "edit ~/AppData/local/nvim", {})
vim.api.nvim_create_user_command("H", "tab help <args>", {
	nargs = "?",
	complete = function(arg_lead, _, _)
		return vim.fn.getcompletion(arg_lead, "help")
	end,
})

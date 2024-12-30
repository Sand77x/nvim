local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- dependency
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		-- lsp stuff
		{ "williamboman/mason.nvim" },
		{ "rafamadriz/friendly-snippets" },
		{ "mfussenegger/nvim-jdtls" },
		{ "leafOfTree/vim-svelte-plugin" },
		-- plpugins with actual configuration
		{ import = "plugins" },
		-- helpful for dev stuff
		{ "mattn/emmet-vim" },
		{ "tpope/vim-commentary" },
		{ "wellle/targets.vim" },
	},
})

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
	{ import = "plugins" },
	"williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	-- init.lua:
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                              , branch = '0.1.1',
	dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
})

vim.cmd.colorscheme "catppuccin"

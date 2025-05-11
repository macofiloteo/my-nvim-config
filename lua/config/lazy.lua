local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
vim.g.mapleader = " " -- the leader key is used in many keymaps,

local plugins = {
    -- plugins go here
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }, -- color scheme
    {"nvim-telescope/telescope.nvim", tag = "0.1.8"},
    {"nvim-telescope/telescope-ui-select.nvim"},
    {"nvim-tree/nvim-web-devicons", opts = {}},
    {
	    "nvim-tree/nvim-tree.lua",
	    version = "*",
	    lazy = false,
	    dependencies = {
		    "nvim-tree/nvim-web-devicons",
	    },
    },
    {
	    "mason-org/mason.nvim",
	    "mason-org/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
    }
}

require("lazy").setup(plugins, {})

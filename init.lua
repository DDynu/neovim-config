vim.cmd("set autochdir")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')

vim.g.mapleader = " "

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
		
local plugins = {
	{"catppuccin/nvim", name = "catppuccin", priority = 1000}, 						

	--add telescope

    	{
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	--add plenery
    	{
  			"nvim-lua/plenary.nvim",
    	},
	--add tree sitter 
	{
			"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
		}
}
local opts = {}

require("lazy").setup(plugins, opts)

--add catpuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"


--add telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--add treesitter configs
local configs = require("nvim-treesitter.configs");
configs.setup({
          ensure_installed = { "c", "lua", "javascript", "html", "css"},
          highlight = { enable = true },
          indent = { enable = true },  
        })


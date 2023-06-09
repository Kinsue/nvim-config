local set = vim.o
set.rnu = true
set.number = true
-- set.clipboard = "unnamed"

-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 500,
		})
	end,
})

-- keybindings
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)

-- ESC 替换
vim.keymap.set("i", "jj", "<esc>")

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)

-- 可视行跳转按键 https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- lazy.nvim
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
	-- ColorScheme
	{
		"RRethy/nvim-base16",
		lazy = true,
	},
	-- Telescope
	{
		keys = {
			{ "<leader>p",  ":Telescope find_files<CR>", desc = "find files" },
			{ "<leader>gr", ":Telescope live_grep<CR>",  desc = "grep in files" },
			{ "<leader>rs", ":Telescope resume<CR>",     desc = "resume" },
			{ "<leader>q",  ":Telescope oldfiles<CR>",   desc = "oldfiles" },
		},
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- Mason
	{
		event = "VeryLazy",
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	-- lspconfig
	{
		event = "VeryLazy",
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim"
		},
	},

	-- {
	--   "folke/persistence.nvim",
	--   event = "BufReadPre", -- this will only start session saving when an actual file was opened
	--   opts = {
	-- 	    -- add any custom options here
	-- 	 }
	-- }
})
vim.cmd.colorscheme("base16-tender")

-- Telescope keybind
vim.keymap.set("n", "<Leader>[", "<C-o>", opt)
vim.keymap.set("n", "<Leader>]", "<C-i>", opt)


require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").clangd.setup {}
require("lspconfig").lua_ls.setup {}

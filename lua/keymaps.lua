-- keybindings
local opt = { noremap = true,  -- 非递归
              silent = true,  -- 不显示消息
}

-- 窗格切换
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)

-- 方向键切换窗格大小
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opt)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opt)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opt)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opt)

-- ESC 替换
vim.keymap.set("i", "jj", "<esc>")

-- Leader Key
vim.g.mapleader = " "

-- 窗格划分快捷键
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)

-- 可视行跳转按键 https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

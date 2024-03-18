vim.g.mapleader = " "

local keymap = vim.keymap

-- ----------插入模式--------------

-- ----------视觉模式--------------

-- ----------正常模式--------------
-- 窗口
keymap.set("n","<leader>sv","<C-w>v") --水平新增窗口

keymap.set("n","<leader>sh","<C-w>s") --垂直新增窗口

-- 取消高亮
keymap.set("n","<leader>nh",":nohl<CR>")

-- -----------插件----------------
-- neo-tree
keymap.set("n","<leader>e",":Neotree toggle=true<CR>")
--切换buffer
keymap.set("n","<leader>l",":bnext<CR>")
keymap.set("n","<leader>h",":bprevious<CR>")


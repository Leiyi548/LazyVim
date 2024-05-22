-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- force delete buffer
-- stylua: ignore
-- map("n", "<leader>bx", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete word" })

-- 让 ctrl+delete 等于 ctrl+w 去删除光标前面的单词
map({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word" })

-- better paste
map({ "i" }, "<C-v>", "<C-r>*", { desc = "Paste" })

-- center current line
map({ "i" }, "<C-l>", "<C-o>zz", { desc = "center current line" })

-- 防止 visual mode p 的内容会替换剪贴板内容
map("x", "p", '"_dP')

-- Home End
map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

-- remove lazyvim Default keymap
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-l>")
-- vim.keymap.del({ "n", "x" }, "j")
-- vim.keymap.del({ "n", "x" }, "k")
vim.keymap.del("n", "<leader>l")
map("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode in terminal" })

-- lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open Lazy float window" })

-- :x
map("n", "<leader>qx", "<cmd>x<cr>", { desc = "save close window" })

-- delete a char
map({ "i", "c" }, "<C-d>", "<Del>", { desc = "delete a char" })

-- add empty lines before and after cursor line
map("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>", { desc = "Put empty line above" })
map("n", "go", "<cmd>call append(line('.'),     repeat([''], v:count1))<cr>", { desc = "Put empty line below" })

-- fast save
map({ "n", "i", "x" }, "<C-s>", function()
  vim.cmd("w")
  local time = os.date("%T")
  vim.api.nvim_command('echohl @class |  echom "saved ' .. time .. '"')
  -- 模仿发送<esc> 进入 normal 模式
  -- 创建一个 Normal 模式的模拟按键序列
  local normal_keys = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  -- 发送模拟按键序列
  vim.api.nvim_feedkeys(normal_keys, "n", true)
end)

-- nohl
map("n", "<leader>h", "<cmd>nohl<cr>", { desc = "clear highlight" })

-- force quit all
map("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "force quit all" })

-- better ctrl-d ctrl-u
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down half page and center page" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up half page and center page" })

-- move screen left right
map("n", "<C-b>", "5zh", { desc = "scroll left half page and center page" })
map("n", "<C-f>", "5zl", { desc = "scroll right half page and center page" })
map("n", "<Left>", "5zh", { desc = "scroll left half page and center page" })
map("n", "<Right>", "5zl", { desc = "scroll right half page and center page" })

-- Move Lines
map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- window jump
-- map("n", "<leader>1", "1<C-w>w", { desc = "Go to window 1" })
-- map("n", "<leader>2", "2<C-w>w", { desc = "Go to window 2" })
-- map("n", "<leader>3", "3<C-w>w", { desc = "Go to window 3" })
-- map("n", "<leader>4", "4<C-w>w", { desc = "Go to window 4" })
-- map("n", "<leader>5", "5<C-w>w", { desc = "Go to window 5" })
-- map("n", "<leader>6", "6<C-w>w", { desc = "Go to window 6" })
-- map("n", "<leader>7", "7<C-w>w", { desc = "Go to window 7" })
-- map("n", "<leader>8", "8<C-w>w", { desc = "Go to window 8" })
-- map("n", "<leader>9", "9<C-w>w", { desc = "Go to window 9" })

-- change window origin keymap
map("n", "<C-w>x", "<C-w>s", { desc = "横向分屏当前 buffer" })
map("n", "<C-w>s", "<C-w>x", { desc = "跟下一个窗口进行交换" })

-- bookmark
map("n", "<leader>dm", "<cmd>delmarks!<cr>", { desc = "Delete Bookmarks" })

-- neo-tree
-- map("n", "<leader>e", "<cmd>Neotree position=current<cr>", { desc = "Neotree current buffer" })

-- translate
map("x", "<leader>tw", "<cmd>Translate<cr>", { desc = "Translate the word under the cursor" })

-- message
map("n", "<leader>snm", "<cmd>message<cr>", { desc = "message" })

-- textobject
map({ "x", "o" }, "il", ":<c-u>normal! g_v^<cr>", { desc = "select current line not include whitespace" })
map({ "x", "o" }, "al", ":<c-u>normal! $v0<cr>", { desc = "select current line include whitespace" })

-- blink.cmp 适配虎码
map({ "i", "x", "n" }, "<C-.>", "<cmd>BlinkImZhhToggle<cr>", { desc = "启用虎码" })
map("c", "<C-.>", function()
  require("blink-im-zhh").toggle()
end, { desc = "启用虎码 (cmdline)" })

-- flash-zhh
map({ "x", "n" }, "s", function()
  require("flash-zhh").jump()
end, { desc = "flash虎码跳转" })
map({ "o" }, "r", function()
  require("flash-zhh").jump()
end, { desc = "flash虎码跳转" })

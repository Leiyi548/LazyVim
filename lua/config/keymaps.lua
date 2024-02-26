-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 让 ctrl+delete 等于 ctrl+w 去删除光标前面的单词
map({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word" })

-- Home End
-- map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
-- map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

-- fast save
map({ "n", "i", "v" }, "<C-s>", function()
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

-- telescope buffer
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer by telescope" })

-- flash-zhh.nvim 有些时候不会加载这个插件
-- stylua: ignore
map({"n","x","o"}, "S", function() require("flash-zhh").jump() end, { desc = "Flash between Chinese(tiger code)" })

-- toggle cmp_im
map({ "n" }, "<leader><Space>", function()
  vim.notify(string.format("虎码%s", require("cmp_im").toggle() and "启动" or "退出"))
end)
map({ "n" }, "<leader>,", function()
  require("cmp_im").toggle_chinese_symbol()
end)

-- better ctrl-d ctrl-u
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down half page and center page" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up half page and center page" })

-- move screen left right
map("n", "<C-b>", "5zh", { desc = "scroll left half page and center page" })
map("n", "<C-f>", "5zl", { desc = "scroll right half page and center page" })

-- Move Lines
map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- window jump
map("n", "<leader>1", "1<C-w>w", { desc = "Jump to window1" })
map("n", "<leader>2", "2<C-w>w", { desc = "Jump to window2" })
map("n", "<leader>3", "3<C-w>w", { desc = "Jump to window3" })
map("n", "<leader>4", "4<C-w>w", { desc = "Jump to window4" })
map("n", "<leader>5", "5<C-w>w", { desc = "Jump to window5" })
map("n", "<leader>6", "6<C-w>w", { desc = "Jump to window6" })
map("n", "<leader>7", "7<C-w>w", { desc = "Jump to window7" })
map("n", "<leader>8", "8<C-w>w", { desc = "Jump to window8" })
map("n", "<leader>9", "9<C-w>w", { desc = "Jump to window9" })

-- obsidian
-- stylua: ignore start
map("n", "<leader>oo", function() require("utils.advancedurl").obsidianOpenCurrentFile() end, { desc = "Obsidian open current file" })
map("n", "<leader>of", function() require("utils.advancedurl").markdownlintCurrentFile()() end, { desc = "Obsidian format current file" })
-- stylua: ignore end

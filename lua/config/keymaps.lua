-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 让 ctrl+delete 等于 ctrl+w 去删除光标前面的单词
map({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word" })

-- Home End
map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

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

-- telescope buffer
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer by telescope" })

-- gitsign
map("n", "<leader>gj", "<cmd>gitsign prev_hunk<cr>", { desc = "Jump to the previous hunk in the current buffer." })
map("n", "<leader>gk", "<cmd>gitsign next_hunk<cr>", { desc = "Jump to the next hunk in the current buffer." })
-- stylua: ignore start
map("n", "<leader>gpl", "<cmd>gitsign preview_hunk_inline<cr>", { desc = "Jump to the next hunk in the current buffer." })
map( "n", "<leader>gpf", "<cmd>gitsign preview_hunk<cr>", { desc = "Preview the hunk at the cursor position in a floating window." })
-- stylua: ignore end

-- flash-zhh.nvim 有些时候不会加载这个插件
-- stylua: ignore
map({"n","x","o"}, "S", function() require("flash-zhh").jump() end, { desc = "Flash between Chinese(tiger code)" })

-- toggle cmp_im
map({ "n" }, "<leader>cn", function()
  vim.notify(string.format("IM is %s", require("cmp_im").toggle() and "enabled" or "disabled"))
end)

-- Move Lines
map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

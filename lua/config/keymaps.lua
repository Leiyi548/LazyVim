-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Home End
map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

-- fast save
map({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd("w")
  local time = os.date("%T")
  vim.api.nvim_command('echohl @class |  echom "saved ' .. time .. '"')
  -- 创建一个 Normal 模式的模拟按键序列
  local normal_keys = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  -- 发送模拟按键序列
  vim.api.nvim_feedkeys(normal_keys, "n", true)
end)

-- nohl
map("n", "<leader>h", "<cmd>nohl<cr>", { desc = "clear highlight" })

-- telescope buffer
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer by telescope" })

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

-- vim commandmode git alias
vim.cmd([[cnoreabbrev <expr> git getcmdtype() == ':' && getcmdline() ==# 'git' ? 'Git' : 'git']])
-- git branch
vim.cmd([[cnoreabbrev <expr> gb getcmdtype() == ':' && getcmdline() ==# 'gb' ? 'Git branch' : 'gb']])
vim.cmd([[cnoreabbrev <expr> gba getcmdtype() == ':' && getcmdline() ==# 'gba' ? 'Git branch -a' : 'gba']])
-- git checkout
vim.cmd([[cnoreabbrev <expr> gco getcmdtype() == ':' && getcmdline() ==# 'gco' ? 'Git checkout' : 'gco']])
vim.cmd([[cnoreabbrev <expr> ge getcmdtype() == ':' && getcmdline() ==# 'ge' ? 'Gedit' : 'ge']])
vim.cmd([[cnoreabbrev <expr> gr getcmdtype() == ':' && getcmdline() ==# 'gr' ? 'Gread' : 'gr']])
-- git stash
vim.cmd([[cnoreabbrev <expr> gst getcmdtype() == ':' && getcmdline() ==# 'gst' ? 'Git stash' : 'gst']])
vim.cmd([[cnoreabbrev <expr> gsts getcmdtype() == ':' && getcmdline() ==# 'gsts' ? 'Git stash save' : 'gsts']])
vim.cmd([[cnoreabbrev <expr> gstl getcmdtype() == ':' && getcmdline() ==# 'gstl' ? 'Git stash list' : 'gstl']])
vim.cmd([[cnoreabbrev <expr> gstc getcmdtype() == ':' && getcmdline() ==# 'gstc' ? 'Git stash clear' : 'gstc']])

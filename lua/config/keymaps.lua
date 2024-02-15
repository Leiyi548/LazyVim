-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Home End
map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

-- nohl
map("n", "<leader>h", "<cmd>nohl<cr>", { desc = "clear highlight" })

-- telescope buffer
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer by telescope" })

-- flash-zhh.nvim 有些时候不会加载这个插件
-- stylua: ignore
map({"n","x","o"}, "S", function() require("flash-zhh").jump() end, { desc = "Flash between Chinese(tiger code)" })

-- toggle cmp_im
map({ "n", "v", "c", "i" }, "<leader>zh", function()
  vim.notify(string.format("IM is %s", require("cmp_im").toggle() and "enabled" or "disabled"))
end)

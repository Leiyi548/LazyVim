-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 根据时间来切换主题明亮还是暗黑
local hour = tonumber(os.date("%H"))
if hour >= 6 and hour < 18 then
  vim.o.background = "light"
  vim.cmd("colorscheme everforest")
else
  vim.o.background = "dark"
end

-- neovide setting
if vim.g.neovide then
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
end

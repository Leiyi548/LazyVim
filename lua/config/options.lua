-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- neovide font setting
  -- https://www.nerdfonts.com/font-downloads
  vim.o.guifont = "FiraCode Nerd Font,LXGW WenKai GB Screen R,TumanPUA:h18" -- text below applies for VimScript
  -- vim.g.neovide_transparency = 0.95
end

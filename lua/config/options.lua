-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- neovide font setting
  vim.o.guifont = "Fira Code,LXGW WenKai GB Screen R,TumanPUA:h16" -- text below applies for VimScript
  vim.g.neovide_transparency = 0.95
end

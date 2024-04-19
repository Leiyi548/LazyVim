-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.background = "dark"
vim.opt.foldmethod = "manual"
vim.opt.foldtext = "foldtext()"
vim.opt.cursorcolumn = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.conceallevel = 0 -- Hide * markup for bold and italic
-- vim.opt.showbreak = '↳'
vim.opt.showbreak = ""
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:↲"
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = 'neovide %{expand("%:p")}'
-- if vim.loop.os_uname().sysname == "Windows_NT" then
-- vim.opt.shell = "powershell.exe pwsh"
-- end

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- neovide font setting
  -- https://www.nerdfonts.com/font-downloads
  vim.o.guifont = "FiraCode Nerd Font,霞鹜文楷 GB 屏幕阅读版,TumanPUA:h20" -- text below applies for VimScript
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_transparency = 0.95
end

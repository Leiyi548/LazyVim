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

-- floaterm 用 pwsh（cmd.exe 行编辑器对注入式宽字符有缺陷，虎码上屏会顶字）。
-- 放在 options.lua 保证先于 vim-floaterm 的 plugin 文件执行，不受懒加载时机影响。
-- 用 exepath 解析绝对路径，避免 Neovide 图形界面启动时 PATH 与终端不一致导致找不到 pwsh。
do
  local pwsh = vim.fn.exepath("pwsh")
  if pwsh == "" then
    -- GUI 环境 PATH 可能不含 WindowsApps，回退到已知的默认安装位置
    local candidates = {
      os.getenv("LOCALAPPDATA") and (os.getenv("LOCALAPPDATA") .. "\\Microsoft\\WindowsApps\\pwsh.exe") or nil,
      "C:\\Program Files\\PowerShell\\7\\pwsh.exe",
    }
    for _, c in ipairs(candidates) do
      if c and vim.fn.filereadable(c) == 1 then
        pwsh = c
        break
      end
    end
  end
  if pwsh ~= "" then
    vim.g.floaterm_shell = pwsh .. " -NoLogo"
  end
end

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- neovide font setting
  -- https://www.nerdfonts.com/font-downloads
  local username = os.getenv("USERNAME")
  if (username == "72154") then
    vim.o.guifont = "FiraCode Nerd Font,霞鹜文楷 GB 屏幕阅读版,TumanPUA:h14"
  else
    vim.o.guifont = "FiraCode Nerd Font,霞鹜文楷 GB 屏幕阅读版,TumanPUA:h16"
  end

  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_transparency = 0.95
end

--lazyvim setting
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_blink_main = false -- 不使用最新版的 blink.cmp

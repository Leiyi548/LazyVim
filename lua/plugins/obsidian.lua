local usename = os.getenv("USERNAME")
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  cmd = { "Obsidian" },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    footer = { enabled = false }, -- 直接关掉,绕开 #555 的逐字卡
    workspaces = {
      {
        name = "Valut",
        path = function()
          if usename == "72154" then
            return "E:/Power/软硬件学习/"
          else
            return "E:/myGithub/People/"
          end
        end,
      },
    },
  },
  keys = {
    { "<space>oh", "<cmd>Obsidian help<cr>", desc = "打开 Snacks.picker 搜索 Obsidian help" },
  },
}

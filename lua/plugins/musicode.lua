return {
  "MisakiForacy/musicode.nvim",
  event = "InsertEnter",
  config = function()
    require("musicode").setup({
      enabled = true,
      mode = "flow", -- "flow" | "rhythm"
      sound = { backend = "none" }, -- "none"(纯视觉) | "rpc"(音频)
    })
    -- 默认下方开启，关闭掉
    require("musicode").viz_toggle()
  end,
}

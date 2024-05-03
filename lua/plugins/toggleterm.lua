return {
  "akinsho/toggleterm.nvim",
  cmd = "Toggleterm",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shell = "pwsh",
  },
  keys = {
    -- stylua: ignore start
    {"<C-m>","<cmd>ToggleTerm direction=tab<cr>",mode = {"n","x","i","t"},desc= "toggleterm in new tab"},
    {"<C-j>","<cmd>ToggleTerm direction=horizontal<cr>",mode = {"n","x","i","t"},desc= "toggleterm horizontal split"},
    {"<C-l>","<cmd>ToggleTerm direction=vertical size=40<cr>",mode = {"n","x","i","t"},desc= "toggleterm vertical split"},
    {"<C-2>","<cmd>ToggleTerm direction=float<cr>",mode = {"n","x","i","t"},desc= "toggleterm horizontal float"},
    -- stylua: ignore end
  },
}

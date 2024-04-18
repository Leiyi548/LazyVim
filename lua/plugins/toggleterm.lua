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
    {"<F2>","<cmd>ToggleTerm direction=tab<cr>",mode = {"n","x","i","t"},desc= "toggleterm in new tab"},
    {"<F5>","<cmd>ToggleTerm direction=horizontal<cr>",mode = {"n","x","i","t"},desc= "toggleterm horizontal split"},
    {"<F6>","<cmd>ToggleTerm direction=vertical size=40<cr>",mode = {"n","x","i","t"},desc= "toggleterm vertical split"},
    -- stylua: ignore end
  },
}

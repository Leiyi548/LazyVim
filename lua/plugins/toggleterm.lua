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
    {"<leader><tab><tab>","<cmd>ToggleTerm direction=tab<cr>",desc= "toggleterm in new tab"},
    {"<leader>vv","<cmd>ToggleTerm direction=vertical<cr>",desc= "toggleterm vertical split"},
    {"<leader>tt","<cmd>ToggleTerm direction=horizontal<cr>",desc= "toggleterm horizontal split"},
    -- stylua: ignore end
  },
}

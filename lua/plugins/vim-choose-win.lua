return {
  "t9md/vim-choosewin",
  enabled = false,
  config = function()
    -- if you want to use overlay feature
    vim.g.choosewin_overlay_enable = 1
  end,
  keys = {
    { "<leader>ws", "<cmd>ChooseWin<cr>", desc = "Choosewin" },
    { "<leader>wS", "<cmd>ChooseWinSwap<cr>", desc = "ChooseWinSwap" },
  },
}

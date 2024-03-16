return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gedit", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
  keys = {
    -- stylua: ignore start
    { "<leader>gt", "<cmd>G<cr>", desc = "[G]it s[t]atus(fugitive)", },
    { "<leader>gT", "<cmd>tab G<cr>", desc = "Open fugitive in new tab", },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "[G]it [p]ush", },
    -- stylua: ignore end
  },
}

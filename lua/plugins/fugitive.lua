return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gedit", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
  keys = {
    -- stylua: ignore start
    { "<leader>gt", "<cmd>G<cr>", desc = "[G]it s[t]atus(fugitive)", },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "[G]it [p]ush", },
    -- stylua: ignore end
  },
}

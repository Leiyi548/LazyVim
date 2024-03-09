return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gedit", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
  keys = {
    -- stylua: ignore start
    { "<leader>gf", "<cmd>G<cr>", desc = "open fugitive window", },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push", },
    -- stylua: ignore end
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    { ";f", "<cmd>NvimTreeFindFile<cr>", "NvimTreeFindFile" },
  },
}

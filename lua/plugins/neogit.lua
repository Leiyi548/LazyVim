return {
  "NeogitOrg/neogit",
  enabled = true,
  opts = {
    integrations = {
      diffview = true,
      snacks = true,
    },
    mappings = {
      status = {
        ["s"] = false,
        ["a"] = "Stage",
      },
    },
  },
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit window in new tab" },
  },
}

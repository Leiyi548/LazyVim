return {
  "NeogitOrg/neogit",
  enabled = true,
  opts = {
    integrations = {
      diffview = true,
      snacks = true,
    },
    disable_line_numbers = false,
    disable_relative_line_numbers = false,
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

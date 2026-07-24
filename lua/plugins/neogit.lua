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
        -- section 跳转
        ["gc"] = function()
          vim.fn.search("Recent Commits", "w")
        end,
        ["gu"] = function()
          vim.fn.search("Unstaged changes", "w")
        end,
        ["gs"] = function()
          vim.fn.search("Staged changes", "w")
        end,
        ["gt"] = function()
          vim.fn.search("Untracked files", "w")
        end,
      },
    },
  },
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit window in new tab" },
  },
}

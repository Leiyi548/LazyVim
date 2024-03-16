return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disable_mouse = false,
    disabled_filetypes = {
      "neo-tree",
      "noice",
      "NeogitLogView",
      "NeogitStatus",
      "help",
      "fugitive",
      "qf",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "oil",
    },
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
  },
}

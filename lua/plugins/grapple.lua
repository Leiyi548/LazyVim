return {
  "cbochs/grapple.nvim",
  enabled = false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    scope = "global",
    icons = true,
    quick_select = "123456789",
    ---How a tag's path should be rendered in Grapple windows
    ---  "relative": show tag path relative to the scope's resolved path
    ---  "basename": show tag path basename and directory hint
    ---@type "basename" | "relative"
    style = "basename",
  },
  keys = {
    { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<End>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { "<BS>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<Down>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<c-g>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<c-t>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

    { "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
    { "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
  },
}

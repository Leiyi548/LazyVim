return {
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
    keys = {
      -- stylua: ignore start
      { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu"},
      { "<leader>a", function() require("harpoon"):list():append() end, desc = "harpoon add file" },
      { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1" },
      { "<C-n>", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2"},
      { "<C-t>", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3" },
      { "<C-g>", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4" },
      { "<C-m>", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5"},
      -- { "<S-H>", function() require("harpoon"):list():prev() end, desc = "harpoon to prev file" },
      -- { "<S-L>", function() require("harpoon"):list():next() end, desc = "harpoon to next file" },
      { "<C-PageUp>", function() require("harpoon"):list():prev() end, desc = "harpoon to prev file" },
      { "<C-PageDown>", function() require("harpoon"):list():next() end, desc = "harpoon to next file" },
      -- stylua: ignore end
    },
  },
}

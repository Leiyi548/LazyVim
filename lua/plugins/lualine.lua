local number_array = { "󰼏", "󰼐", "󰼑", "󰼒", "󰼓", "󰼔", "󰼕", "󰼖", "󰼗" }
local window_number = {
  function()
    return number_array[vim.api.nvim_win_get_number(0)]
  end,
  always_visible = true,
}
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "letieu/harpoon-lualine",
  },
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = false,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { window_number },
        lualine_b = { "branch" },

        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            path = 1,
            symbols = {
              modified = "", -- Text to show when the file is modified.
              readonly = "", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "", -- Text to show for unnamed buffers.
              -- newfile = ' ', -- Text to show for new created file before first writting
              newfile = "[new]", -- Text to show for new created file before first writting
            },
          },
        },
        lualine_x = {
          {
            function()
              return ""
            end,
            color = function()
              return { fg = require("cmp_im").getChineseSymbolStatus() and "green" or "red" }
            end,
          },
          {
            function()
              return "虎"
            end,
            color = function()
              return { fg = require("cmp_im").getStatus() and "green" or "red" }
            end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = { "progress" },
        lualine_z = {
          "another_item",
          {
            "harpoon2",
            icon = "",
            indicators = { "1", "2", "3", "4" },
            -- active_indicators = { "壹", "贰", "叁", "肆" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]" },
            separator = "",
          },
        },
      },
      inactive_sections = {
        lualine_a = { window_number },
        lualine_b = { { "filename", path = 1, symbols = { modified = "[*]" } } },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}

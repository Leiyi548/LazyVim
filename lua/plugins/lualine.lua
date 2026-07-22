_G.LazyVim = require("lazyvim.util")

local number_array = { "󰼏", "󰼐", "󰼑", "󰼒", "󰼓", "󰼔", "󰼕", "󰼖", "󰼗" }
local window_number = {
  function()
    -- return number_array[vim.api.nvim_win_get_number(0)]
    return vim.api.nvim_win_get_number(0)
  end,
  always_visible = true,
}

local project = {
  function()
    return "󱉭 " .. vim.fs.basename(vim.uv.cwd())
  end,
  always_visible = true,
}
return {
  "nvim-lualine/lualine.nvim",
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
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "snacks_dashboard", "snacks_picker_list", "snacks_picker_input" },
          winbar = { "snacks_dashboard", "snacks_picker_list", "snacks_picker_input" },
        },
      },
      sections = {
        -- lualine_a = { window_number },
        lualine_a = { "mode" },
        -- lualine_b = { "branch" },
        lualine_b = { project, "branch" },

        lualine_c = {
          -- project,
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
          Snacks.profiler.status(),
            -- stylua: ignore
          {
            function()
              return "虎"
            end,
            color = function()
              return { fg = require("blink-im-zhh").getStatus() and "#A7C080" or "grey" }
            end,
          },
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
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
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
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
      winbar = {
        lualine_a = { window_number },
        lualine_b = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            symbols = {
              modified = "", -- Text to show when the file is modified.
              readonly = "", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "", -- Text to show for unnamed buffers.
              -- newfile = ' ', -- Text to show for new created file before first writting
              newfile = "[new]", -- Text to show for new created file before first writting
            },
          },
        },
        lualine_c = {
          {},
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = { window_number },
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            symbols = {
              modified = "", -- Text to show when the file is modified.
              readonly = "", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "", -- Text to show for unnamed buffers.
              -- newfile = ' ', -- Text to show for new created file before first writting
              newfile = "[new]", -- Text to show for new created file before first writting
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}

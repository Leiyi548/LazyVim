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
  color = { fg = LazyVim.ui.fg("Keyword") },
  always_visible = true,
}
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup({
        client_format = function(client_name, spinner, series_messages)
          if #series_messages == 0 then
            return nil
          end
          return {
            name = client_name,
            body = spinner .. " " .. table.concat(series_messages, ", "),
          }
        end,
        format = function(client_messages)
          --- @param name string
          --- @param msg string?
          --- @return string
          local function stringify(name, msg)
            return msg and string.format("%s %s", name, msg) or name
          end

          local sign = "" -- nf-fa-gear \uf013
          local lsp_clients = vim.lsp.get_active_clients()
          local messages_map = {}
          for _, climsg in ipairs(client_messages) do
            messages_map[climsg.name] = climsg.body
          end

          if #lsp_clients > 0 then
            table.sort(lsp_clients, function(a, b)
              return a.name < b.name
            end)
            local builder = {}
            for _, cli in ipairs(lsp_clients) do
              if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
                if messages_map[cli.name] then
                  table.insert(builder, stringify(cli.name, messages_map[cli.name]))
                else
                  table.insert(builder, stringify(cli.name))
                end
              end
            end
            if #builder > 0 then
              return sign .. " " .. table.concat(builder, ", ")
            end
          end
          return ""
        end,
      })
    end,
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
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        -- lualine_a = { window_number },
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          project,
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- {
          --   "filename",
          --   path = 1,
          --   symbols = {
          --     modified = "", -- Text to show when the file is modified.
          --     readonly = "", -- Text to show when the file is non-modifiable or readonly.
          --     unnamed = "", -- Text to show for unnamed buffers.
          --     -- newfile = ' ', -- Text to show for new created file before first writting
          --     newfile = "[new]", -- Text to show for new created file before first writting
          --   },
          -- },
        },
        lualine_x = {
          {
            function()
              return require("lsp-progress").progress()
            end,
          },
          {
            function()
              return ""
            end,
            color = function()
              return { fg = require("cmp_im").getChineseSymbolStatus() and "#A7C080" or "grey" }
            end,
          },
          {
            function()
              return "虎"
            end,
            color = function()
              return { fg = require("cmp_im").getStatus() and "#A7C080" or "grey" }
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
        lualine_z = { "location" },
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

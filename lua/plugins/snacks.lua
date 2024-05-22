local function week_ascii_text()
  return {
    ["Monday"] = {
      "",
      "███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
      "████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
      "██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
      "╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    ["Tuesday"] = {
      "",
      "████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
      "╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
      "   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
      "   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Wednesday"] = {
      "",
      "██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
      "██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
      "██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
      " ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Thursday"] = {
      "",
      "████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
      "╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
      "   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ",
      "   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Friday"] = {
      "",
      "███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
      "██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
      "╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Saturday"] = {
      "",
      "███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
      "╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
      "███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
      "╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    ["Sunday"] = {
      "",
      "███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
      "╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
      "╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
  }
end

local function week_header(concat, append)
  local week_text = {
    ["Monday"] = "😅怎么又周一了！",
    ["Tuesday"] = "😅才周二啊",
    ["Wednesday"] = "怎么才周三啊",
    ["Thursday"] = "周四了，希望这周是双休",
    ["Friday"] = "周五了，要是双休就爽了",
    ["Saturday"] = "服了，谁周六还要上班啊，可恶的mini版大小周！",
    ["Sunday"] = "周末最后一天,Happyday",
  }
  local week = week_ascii_text()
  local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
  local day = daysoftheweek[os.date("*t").wday]
  local tbl = week[day]
  table.insert(tbl, os.date("%Y-%m-%d %H:%M:%S") .. (concat or ""))
  table.insert(tbl, week_text[day])
  -- table.insert(tbl, current_week_day)
  if append then
    vim.list_extend(tbl, append)
  end
  table.insert(tbl, "")
  return tbl
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = function()
    local header_str = table.concat(week_header(), "\n")
    return {
      animate = { enabled = false },
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          function(self)
            local ok, lazy = pcall(require, "lazy")
            if not ok then
              return {}
            end
            local stats = lazy.stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { { footer = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" } }
          end,
        },
        preset = {
          header = header_str,
          keys = {
            { icon = " ", key = "c", desc = "Config",  action = ":lua LazyVim.pick.config_files()()" },
            { icon = " ", key = "p", desc = "Project", action = function() Snacks.picker.projects() end },
            { icon = "󰒲 ", key = "l", desc = "Lazy",    action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit",    action = ":qa" },
          },
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
              ["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
              ["<C-Left>"] = { "preview_scroll_left", mode = { "n", "i" } },
              ["<C-Right>"] = { "preview_scroll_right", mode = { "n", "i" } },
            },
          },
        },
        sources = {
          explorer = {
            -- sidebar 默认宽 40，按需调小；仅作用于 explorer，不影响其他 picker
            layout = { layout = { width = 30 } },
          },
        },
        db = { sqlite3_path =  vim.fn.stdpath("data") .. "/sqlite3.dll" },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = { enabled = true },
    }
  end,
  keys = {
    {
      "<C-k><C-k>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
  },
}

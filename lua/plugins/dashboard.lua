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
    ["Monday"] = "今天周一要努力找工作哦",
    ["Tuesday"] = "今天周二要努力找工作哦",
    ["Wednesday"] = "今天周三要努力找工作哦",
    ["Thursday"] = "今天周四要努力找工作哦",
    ["Friday"] = "今天周五要努力找工作哦",
    ["Saturday"] = "周末,Happyday",
    ["Sunday"] = "周末,Happyday",
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
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[
     ██ ██    ██ ███████ ████████     ██████   ██████      ██ ████████ 
     ██ ██    ██ ██         ██        ██   ██ ██    ██     ██    ██    
     ██ ██    ██ ███████    ██        ██   ██ ██    ██     ██    ██    
██   ██ ██    ██      ██    ██        ██   ██ ██    ██     ██    ██    
███████ ████████ ███████    ██        ██████   ██████      ██    ██    


                            不要忘记每日记账                           
    ]]

    logo = string.rep("\n", 3) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        -- header = vim.split(logo, "\n"),
        header = week_header(),
        -- stylua: ignore
        center = {
          { action = 'lua require("utils.fancy_telescope").findConfigFileDashboard()',    desc = " Config", icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "Telescope projects",                                       desc = " Project",         icon = "󱉭 ", key = "p" },
          { action = "Telescope projectBrowser",                                 desc = " Browser",         icon = " ", key = "b" },
          { action = "Telescope oil",                                            desc = " Oil",             icon = "󰐅 ", key = "o" },
          { action = 'lua require("utils.mybeancount").make_beancount()',        desc = " Beancount",       icon = " ",key = "m" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

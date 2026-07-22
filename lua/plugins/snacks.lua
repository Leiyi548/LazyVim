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
  -- 每天的打工感悟都准备了好多句，每次打开随机抽一句
  -- 全部用单码点 emoji（👔 💼 📊 📅 📝 😩 😫 😭 😞 💀 🔥），避免 Neovim 渲染不了 ZWJ 多码点序列
  -- 角色：项目经理（需求变更、排期、背锅、开会、对齐拉通、甲方撕逼）
  local week_text = {
    ["Monday"] = {
      "👔 周一，项目经理的魂又没了，晨会一开就是上刑",
      "📅 周一，一周的排期地狱从今早的站会开始",
      "😩 周一，需求还没对齐，老板就要我这周的闭环计划",
      "👔 周一，新的轮回开始，今天也是被甲方按头改方案的一天",
    },
    ["Tuesday"] = {
      "😫 周二，离周末还有五个世纪那么远…",
      "📊 周二，进度表又要重画，因为需求又双叒变了",
      "👔 周二，已经忘了周末长什么样，只记得甲方的脸",
      "📝 周二，工资？我这种背锅项目经理只配谈 KPI，不配谈钱",
    },
    ["Wednesday"] = {
      "🗓️ 周三，人已经格式化了，只剩躯壳在机械拉通对齐",
      "👔 周三，传说中的一周分水岭，可惜我游不过去",
      "📊 周三，上半周熬没了，下半周的需求还没对齐，人已散架",
      "😩 周三，带薪上厕所是我一天中最自由的三分钟",
    },
    ["Thursday"] = {
      "🔥 周四，被变更的需求按在地上摩擦，排期全炸了",
      "👔 周四，胜利的影子都看见了，可活还是干不完",
      "📅 周四，这周最绝望的一天，周报里的进度还空着",
      "📝 周四，改了八版方案，老板说还是用第一版吧",
    },
    ["Friday"] = {
      "📊 周五，表面胜利在望，背地里风险堆成山根本摸不了鱼",
      "👔 周五，心情刚飞起来，就被一个紧急会议拽回工位",
      "😫 周五，离双休只差一天，偏偏这一天最长",
      "👔 周五，下班前的复盘会，总能把好心情开没",
    },
    ["Saturday"] = {
      "📅 服了，谁周六还要来公司给甲方当牛马啊，可恶的mini版大小周！",
      "📊 周六，别人的周末，我的工作日，世界的参差",
      "👔 周六，闹钟照常响，原来项目经理的命里没有休息二字",
      "😩 周六，大小周是资本主义温柔的酷刑，一周七天只放一天假",
    },
    ["Sunday"] = {
      "😞 周日，想到明早的周一，连呼吸都变得沉重了…",
      "📝 周日，假期的尾巴被焦虑咬得只剩渣，明天又要上刑",
      "👔 周日，最后的自由时光，用来为周一的撕逼做心理建设",
      "😫 周日晚上，emo 是项目经理的保留节目，周一焦虑症提前上线",
    },
  }
  -- 每次打开重新播种，保证随机抽句真正随机
  math.randomseed(os.time() + (vim.loop.hrtime() or 0))
  local week = week_ascii_text()
  local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
  local day = daysoftheweek[os.date("*t").wday]
  local tbl = week[day]
  -- table.insert(tbl, os.date("%Y-%m-%d %H:%M:%S") .. (concat or ""))
  local day_quotes = week_text[day]
  table.insert(tbl, day_quotes[math.random(#day_quotes)])
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

    -- 让 picker 预览窗口标题显示当前文件的绝对路径（默认只显示文件名 basename）
    local picker_preview = require("snacks.picker.preview")
    local function show_abs_path(ctx)
      local path = Snacks.picker.util.path(ctx.item)
      if path and path ~= "" then
        -- :p 得到绝对路径，统一成类似 Linux 的 / 分隔符
        local abs = vim.fn.fnamemodify(path, ":p"):gsub([[\]], "/")
        -- 把用户主目录替换成 ~（类似 Linux 的 $HOME），用 expand("~") 取主目录，跨机器可移植
        -- 注意：部分 Windows 上 expand("~") 会带尾随斜杠，先去掉，否则替换后会吃掉一个 /
        local home = vim.fn.fnamemodify(vim.fn.expand("~"), ":p"):gsub([[\]], "/"):gsub("/$", "")
        if home ~= "" then
          local home_lower = home:lower()
          -- 仅当 home 之后紧跟 / 才替换，避免误伤
          if abs:lower():sub(1, #home) == home_lower and abs:sub(#home + 1, #home + 1) == "/" then
            abs = "~" .. abs:sub(#home + 1)
          end
        end
        ctx.preview:set_title(abs)
        if ctx.preview.win then
          ctx.preview.win:set_title(abs)
        end
      end
    end
    for _, name in ipairs({ "file", "image", "directory" }) do
      local orig = picker_preview[name]
      if orig then
        picker_preview[name] = function(ctx)
          orig(ctx)
          show_abs_path(ctx)
        end
      end
    end

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
            return {
              { footer = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" },
            }
          end,
        },
        preset = {
          header = header_str,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = function()
                vim.cmd.cd(vim.fn.stdpath("config"))
                Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
              end,
            },
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
                Snacks.picker.projects()
              end,
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent file",
              action = function()
                Snacks.picker.recent()
              end,
            },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
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
              ["<C-BS>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
              ["o"] = { "confirm", mode = { "n" } },
            },
          },
        },
        sources = {
          explorer = {
            -- sidebar 默认宽 40，按需调小；仅作用于 explorer，不影响其他 picker
            -- preview = false：去掉 sidebar 预设里 preview 窗口的 top border，否则输入框和文件列表之间会多一条横线
            layout = { layout = { width = 30 }, preview = false },
            -- 默认显示隐藏文件（dotfile）。若还想显示被 .gitignore 忽略的文件，可再加 ignored = true
            hidden = true,
            -- normal 模式下用 o 键打开文件（与 l 行为一致：在 Neovim 中打开）
            win = {
              list = {
                keys = {
                  ["o"] = "confirm",
                },
              },
            },
          },
          projects = {
            -- 回车选中项目时：不加载 session，切到项目目录并直接打开文件搜索
            confirm = function(picker, item)
              local dir = item and Snacks.picker.util.dir(item)
              if not dir or dir == "" then
                return
              end
              picker:close()
              vim.cmd.cd(dir) -- 切换全局工作目录到项目根，后续新开 tab / 终端都会继承
              Snacks.picker.files({ cwd = dir }) -- 在该项目路径下搜索文件
            end,
          },
        },
        db = { sqlite3_path = vim.fn.stdpath("data") .. "/sqlite3.dll" },
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
      "<leader>bf",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Search Buffers",
    },
    {
      "<leader>bb",
      function()
        -- 居中（default preset，而非顶部的 vscode）+ 无预览（preview = false）
        -- focus = "list"：打开时焦点落在列表窗口（normal 模式），按 i 切到输入框过滤
        Snacks.picker.buffers({
          focus = "list",
          -- preset = "default" 是居中布局，但默认 0.8x0.8 偏大；
          -- 内层再嵌 layout = {...} 覆盖尺寸为 vscode 同款 0.4x0.4（深度合并保留 default 的居中盒子）
          layout = {
            preset = "default",
            preview = false,
            layout = { width = 0.4, min_width = 80, height = 0.4 },
          },
        })
      end,
      desc = "Search Buffers (centered, no preview)",
    },
  },
}

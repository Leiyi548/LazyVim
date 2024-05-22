-- ~/.config/nvim/lua/plugins/render-markdown.lua
-- render-markdown.nvim 的 lazy.nvim 插件配置，含全部配置项，每行均有中文注释。
-- 说明：下面写的基本都是插件默认值，你可以按需修改；不想改的项可以直接删掉，删掉后会自动回退到默认值。
return {
  "MeanderingProgrammer/render-markdown.nvim", -- 插件仓库地址（GitHub user/repo）
  dependencies = { -- 依赖插件列表
    "nvim-treesitter/nvim-treesitter", -- 必需：用于解析 markdown 语法树
    "nvim-tree/nvim-web-devicons", -- 可选：提供文件/语言图标（也可换成 echasnovski/mini.icons）
  },
  ft = { "markdown", "codecompanion" }, -- 懒加载：仅在打开 markdown 文件类型时加载本插件
  ---@module 'render-markdown'                   -- LuaLS 类型提示：声明模块名，便于补全
  ---@type render.md.UserConfig                  -- LuaLS 类型提示：声明 opts 的类型
  opts = {
    enabled = true, -- 是否默认启用渲染
    render_modes = { "n", "c", "t", "i" }, -- 哪些 Vim 模式下显示渲染视图（普通/命令/终端）
    debounce = 100, -- 更新标记前的防抖毫秒数（仅作用于可见窗口）
    preset = "none", -- 预设风格：obsidian（模仿 Obsidian）/lazy（跟随 LazyVim）/none（不预设）
    log_level = "error", -- 写入日志文件的级别，仅用于插件开发/调试
    log_runtime = false, -- 是否打印主更新方法的耗时，仅用于调试
    file_types = { "markdown","codecompanion" }, -- 本插件生效的文件类型列表
    max_file_size = 10.0, -- 允许渲染的最大文件大小（MB），超过则忽略
    ignore = function() -- 传入 buffer，返回 true 时本插件不挂载到该 buffer
      return false -- 默认不忽略任何 buffer
    end,
    nested = true, -- 是否渲染嵌套的 markdown（如 markdown 文件里的 markdown 代码块）
    change_events = {}, -- 额外触发渲染循环的事件列表
    restart_highlighter = false, -- 首次挂载后是否重启 treesitter 高亮器（懒加载时可能需要）

    injections = { -- treesitter 语言注入配置（让某些位置按 markdown 解析）
      gitcommit = { -- 针对 gitcommit 文件类型
        enabled = true, -- 是否启用该注入
        query = [[                              -- treesitter 查询语句：把提交信息正文当作 markdown 解析
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
      },
    },

    patterns = { -- 需要为特定文件类型禁用的高亮 pattern
      markdown = { -- markdown 文件类型
        disable = true, -- 禁用下列内置指令（如代码块周围被隐藏的行）
        directives = { -- 要禁用的指令列表
          { id = 17, name = "conceal_lines" }, -- 指令 17：隐藏行
          { id = 18, name = "conceal_lines" }, -- 指令 18：隐藏行
        },
      },
    },

    anti_conceal = { -- 反隐藏：光标所在行显示原始文本而非渲染结果
      enabled = true, -- 是否启用反隐藏
      disabled_modes = false, -- 哪些模式禁用反隐藏（false 表示所有模式都启用）
      above = 0, -- 光标上方额外显示原文的行数
      below = 0, -- 光标下方额外显示原文的行数
      ignore = { -- 无视反隐藏、始终保持渲染的元素
        code_background = true, -- 代码块背景始终渲染
        indent = true, -- 缩进始终渲染
        sign = true, -- 标记列始终渲染
        virtual_lines = true, -- 虚拟行始终渲染
      },
    },

    padding = { -- 填充空白相关配置
      highlight = "Normal", -- 添加空白时使用的高亮组（应与背景一致）
    },

    latex = { -- LaTeX 公式渲染配置
      enabled = true, -- 是否开启 LaTeX 渲染
      render_modes = false, -- 额外渲染 LaTeX 的模式（false 用顶层 render_modes）
      converter = { "utftex", "latex2text" }, -- 把公式转成 unicode 的外部程序（按顺序尝试）
      inline = true, -- 渲染行内 LaTeX 公式
      block = true, -- 渲染块级 LaTeX 公式
      highlight = "RenderMarkdownMath", -- LaTeX 块的高亮组
      position = "center", -- 公式渲染位置：above/below/center（居中需单行）
      top_pad = 0, -- LaTeX 块上方空行数
      bottom_pad = 0, -- LaTeX 块下方空行数
    },

    on = { -- 生命周期回调钩子
      attach = function() end, -- 插件首次挂载到 buffer 时调用
      initial = function() end, -- 首次向 buffer 添加标记前调用
      render = function() end, -- 渲染完 buffer 后调用
      clear = function() end, -- 清除 buffer 渲染后调用
    },

    completions = { -- 补全源相关配置
      blink = { enabled = false }, -- blink.cmp 补全源开关
      coq = { enabled = false }, -- coq_nvim 补全源开关
      lsp = { enabled = false }, -- 进程内 LSP 补全开关
      filter = { -- 补全过滤器
        callout = function() -- 过滤 callout 补全项，返回 true 保留
          return true -- 默认保留全部 callout
        end,
        checkbox = function() -- 过滤 checkbox 补全项，返回 true 保留
          return true -- 默认保留全部 checkbox
        end,
      },
    },

    heading = { -- 标题（heading）渲染配置
      enabled = true, -- 是否渲染标题图标与背景
      render_modes = false, -- 额外渲染标题的模式
      atx = true, -- 是否渲染 atx 风格标题（# 开头）
      setext = true, -- 是否渲染 setext 风格标题（下划线式）
      sign = true, -- 是否在标记列渲染标记
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- 各级标题（1~6）替换 # 的图标
      position = "overlay", -- 图标填充方式：eol/right/inline/overlay
      signs = { "󰫎 " }, -- 标记列显示的图标（按标题级别循环）
      width = "full", -- 标题背景宽度：block（文本宽）/full（窗口宽）
      left_margin = 0, -- 标题左侧外边距（<1 的浮点数按窗口比例）
      left_pad = 0, -- 标题左侧内边距
      right_pad = 0, -- width 为 block 时标题右侧内边距
      min_width = 0, -- width 为 block 时标题最小宽度
      border = false, -- 是否在标题上下添加边框
      border_virtual = false, -- 边框是否强制使用虚拟行（而非空行）
      border_prefix = false, -- 是否用前景色高亮边框起始处
      above = "▄", -- 标题上边框使用的字符
      below = "▀", -- 标题下边框使用的字符
      backgrounds = { -- 各级标题背景高亮组（整行）
        "RenderMarkdownH1Bg", -- H1 背景
        "RenderMarkdownH2Bg", -- H2 背景
        "RenderMarkdownH3Bg", -- H3 背景
        "RenderMarkdownH4Bg", -- H4 背景
        "RenderMarkdownH5Bg", -- H5 背景
        "RenderMarkdownH6Bg", -- H6 背景
      },
      foregrounds = { -- 各级标题图标/标记的前景高亮组
        "RenderMarkdownH1", -- H1 前景
        "RenderMarkdownH2", -- H2 前景
        "RenderMarkdownH3", -- H3 前景
        "RenderMarkdownH4", -- H4 前景
        "RenderMarkdownH5", -- H5 前景
        "RenderMarkdownH6", -- H6 前景
      },
      custom = {}, -- 自定义标题 pattern，可按标题内容覆盖图标/前景/背景
    },

    paragraph = { -- 段落渲染配置
      enabled = true, -- 是否渲染段落
      render_modes = false, -- 额外渲染段落的模式
      left_margin = 0, -- 段落左侧外边距（<1 按窗口比例）
      indent = 0, -- 每段首行的缩进量
      min_width = 0, -- 段落最小宽度
    },

    code = { -- 代码块与行内代码渲染配置
      enabled = true, -- 是否渲染代码块与行内代码
      render_modes = false, -- 额外渲染代码块的模式
      sign = true, -- 是否在标记列渲染标记
      conceal_delimiters = true, -- 是否隐藏代码块首尾的 ``` 定界符
      language = true, -- 是否渲染语言标题行
      position = "left", -- 语言图标位置：center/right/left
      language_icon = true, -- 代码块上方是否显示语言图标
      language_name = true, -- 代码块上方是否显示语言名称
      language_info = true, -- 代码块上方是否显示语言额外信息
      language_pad = 0, -- 语言标识周围的内边距
      disable = {}, -- 禁用渲染的语言名称列表
      disable_background = { "diff" }, -- 禁用背景高亮的语言列表（diff 自带背景）
      background_inset = 1, -- 代码块首尾跳过背景渲染的行数
      width = "full", -- 代码块背景宽度：block/full
      left_margin = 0, -- 代码块左侧外边距（<1 按窗口比例）
      left_pad = 0, -- 代码块左侧内边距
      right_pad = 0, -- width 为 block 时右侧内边距
      min_width = 0, -- width 为 block 时最小宽度
      border = "hide", -- 代码块上下边框样式：none/thick/thin/hide
      language_border = "█", -- 语言行填充剩余空间的字符
      language_left = "", -- 语言标识左侧添加的字符
      language_right = "", -- 语言标识右侧添加的字符
      above = "▄", -- thin 边框时代码块上方字符
      below = "▀", -- thin 边框时代码块下方字符
      inline = true, -- 是否渲染行内代码
      inline_left = "", -- 行内代码左侧图标
      inline_right = "", -- 行内代码右侧图标
      inline_pad = 0, -- 行内代码左右内边距
      priority = 140, -- 代码背景高亮的优先级
      highlight = "RenderMarkdownCode", -- 代码块高亮组
      highlight_info = "RenderMarkdownCodeInfo", -- 语言之后信息段的高亮组
      highlight_language = nil, -- 语言名高亮组（覆盖图标提供者的值）
      highlight_border = "RenderMarkdownCodeBorder", -- 边框高亮组（false 表示不高亮）
      highlight_fallback = "RenderMarkdownCodeFallback", -- 图标提供者无值时语言的回退高亮组
      highlight_inline = "RenderMarkdownCodeInline", -- 行内代码高亮组
      highlight_inline_left = nil, -- 行内代码左图标高亮组（默认取反）
      highlight_inline_right = nil, -- 行内代码右图标高亮组（默认取反）
      style = "full", -- 整体渲染风格：none/normal/language/full
    },

    dash = { -- 分隔线（---/***/___）渲染配置
      enabled = true, -- 是否渲染分隔线
      render_modes = false, -- 额外渲染分隔线的模式
      icon = "─", -- 用于生成分隔线的字符（横向重复填满）
      width = "full", -- 分隔线宽度：full/数字/<1 的比例
      left_margin = 0, -- 分隔线左侧外边距
      priority = nil, -- 分隔线的优先级
      highlight = "RenderMarkdownDash", -- 分隔线高亮组
    },

    document = { -- 文档级渲染配置
      enabled = true, -- 是否启用文档渲染
      render_modes = false, -- 额外渲染的模式
      conceal = { -- 基于 lua pattern 隐藏任意文本范围
        char_patterns = {}, -- 字符级隐藏的 pattern 列表
        line_patterns = {}, -- 行级隐藏的 pattern 列表
      },
    },

    bullet = { -- 无序列表符号渲染配置
      enabled = true, -- 是否渲染列表符号
      render_modes = false, -- 额外渲染的模式
      icons = { "●", "○", "◆", "◇" }, -- 各层级替换 -/+/* 的符号（按层级循环）
      ordered_icons = function(ctx) -- 有序列表 n./n) 的符号生成函数
        local value = vim.trim(ctx.value) -- 去除标记文本首尾空白
        local index = tonumber(value:sub(1, #value - 1)) -- 取出序号数字
        return ("%d."):format(index > 1 and index or ctx.index) -- 生成 "序号." 形式
      end,
      left_pad = 0, -- 列表符号左侧内边距
      right_pad = 0, -- 列表符号右侧内边距
      highlight = "RenderMarkdownBullet", -- 列表符号高亮组
      scope_highlight = {}, -- 列表项内容关联的高亮组
      scope_priority = nil, -- 内容高亮的优先级
    },

    checkbox = { -- 任务列表复选框渲染配置
      enabled = true, -- 是否渲染复选框状态
      render_modes = false, -- 额外渲染的模式
      bullet = false, -- 是否在复选框前保留列表符号
      left_pad = 0, -- 复选框左侧内边距
      right_pad = 1, -- 复选框右侧内边距
      unchecked = { -- 未勾选状态 [ ]
        icon = "󰄱 ", -- 未勾选图标
        highlight = "RenderMarkdownUnchecked", -- 未勾选图标高亮组
        scope_highlight = nil, -- 未勾选项关联内容高亮组
      },
      checked = { -- 已勾选状态 [x]
        icon = "󰱒 ", -- 已勾选图标
        highlight = "RenderMarkdownChecked", -- 已勾选图标高亮组
        scope_highlight = nil, -- 已勾选项关联内容高亮组
      },
      custom = { -- 自定义复选框状态（需 neovim >= 0.10.0）
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil }, -- 进行中 [-]
      },
      scope_priority = nil, -- 内容高亮的优先级
    },

    quote = { -- 引用块与 callout 渲染配置
      enabled = true, -- 是否渲染引用块与 callout
      render_modes = false, -- 额外渲染的模式
      icon = "▋", -- 替换 > 的引用图标
      repeat_linebreak = false, -- 换行时是否重复图标（需 neovim >= 0.10）
      highlight = { -- 引用图标高亮组（按嵌套层级循环）
        "RenderMarkdownQuote1", -- 第 1 层引用
        "RenderMarkdownQuote2", -- 第 2 层引用
        "RenderMarkdownQuote3", -- 第 3 层引用
        "RenderMarkdownQuote4", -- 第 4 层引用
        "RenderMarkdownQuote5", -- 第 5 层引用
        "RenderMarkdownQuote6", -- 第 6 层引用
      },
    },

    render = { -- 全局渲染开关
      diff = false, -- diff 模式下是否渲染
    },

    pipe_table = { -- 表格渲染配置
      enabled = true, -- 是否渲染表格
      render_modes = false, -- 额外渲染的模式
      preset = "none", -- 表格边框预设：heavy/double/round/none
      cell = "padded", -- 单元格渲染方式：overlay/raw/padded/trimmed
      cell_offset = function() -- 自定义调整单元格计算宽度
        return 0 -- 默认不偏移
      end,
      padding = 1, -- 单元格内容与边框间的空格数
      min_width = 0, -- padded/trimmed 时单元格最小宽度
      border = { -- 表格边框字符（上3/分隔3/下3/竖线/横线）
        "┌",
        "┬",
        "┐", -- 顶部：左、中、右
        "├",
        "┼",
        "┤", -- 分隔：左、中、右
        "└",
        "┴",
        "┘", -- 底部：左、中、右
        "│",
        "─", -- 竖线、横线
      },
      border_enabled = true, -- 是否渲染表格顶部与底部线
      border_virtual = false, -- 边框是否强制使用虚拟行
      alignment_indicator = "━", -- 分隔行中表示对齐的字符
      head = "RenderMarkdownTableHead", -- 表头及其上方线的高亮组
      row = "RenderMarkdownTableRow", -- 表格数据行及其下方线的高亮组
      style = "full", -- 整体渲染风格：none/normal/full
    },

    callout = { -- callout 标注块配置（GitHub/Obsidian 风格）
      note = {
        raw = "[!NOTE]",
        rendered = "󰋽 Note",
        highlight = "RenderMarkdownInfo",
        category = "github",
      }, -- 提示
      tip = {
        raw = "[!TIP]",
        rendered = "󰌶 Tip",
        highlight = "RenderMarkdownSuccess",
        category = "github",
      }, -- 建议
      important = {
        raw = "[!IMPORTANT]",
        rendered = "󰅾 Important",
        highlight = "RenderMarkdownHint",
        category = "github",
      }, -- 重要
      warning = {
        raw = "[!WARNING]",
        rendered = "󰀪 Warning",
        highlight = "RenderMarkdownWarn",
        category = "github",
      }, -- 警告
      caution = {
        raw = "[!CAUTION]",
        rendered = "󰳦 Caution",
        highlight = "RenderMarkdownError",
        category = "github",
      }, -- 注意
      abstract = {
        raw = "[!ABSTRACT]",
        rendered = "󰨸 Abstract",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      }, -- 摘要
      summary = {
        raw = "[!SUMMARY]",
        rendered = "󰨸 Summary",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      }, -- 总结
      tldr = {
        raw = "[!TLDR]",
        rendered = "󰨸 Tldr",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      }, -- 太长不看
      info = {
        raw = "[!INFO]",
        rendered = "󰋽 Info",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      }, -- 信息
      todo = {
        raw = "[!TODO]",
        rendered = "󰗡 Todo",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      }, -- 待办
      hint = {
        raw = "[!HINT]",
        rendered = "󰌶 Hint",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      }, -- 提示
      success = {
        raw = "[!SUCCESS]",
        rendered = "󰄬 Success",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      }, -- 成功
      check = {
        raw = "[!CHECK]",
        rendered = "󰄬 Check",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      }, -- 检查
      done = {
        raw = "[!DONE]",
        rendered = "󰄬 Done",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      }, -- 完成
      question = {
        raw = "[!QUESTION]",
        rendered = "󰘥 Question",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      }, -- 疑问
      help = {
        raw = "[!HELP]",
        rendered = "󰘥 Help",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      }, -- 帮助
      faq = {
        raw = "[!FAQ]",
        rendered = "󰘥 Faq",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      }, -- 常见问题
      attention = {
        raw = "[!ATTENTION]",
        rendered = "󰀪 Attention",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      }, -- 注意
      failure = {
        raw = "[!FAILURE]",
        rendered = "󰅖 Failure",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 失败
      fail = {
        raw = "[!FAIL]",
        rendered = "󰅖 Fail",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 失败
      missing = {
        raw = "[!MISSING]",
        rendered = "󰅖 Missing",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 缺失
      danger = {
        raw = "[!DANGER]",
        rendered = "󱐌 Danger",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 危险
      error = {
        raw = "[!ERROR]",
        rendered = "󱐌 Error",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 错误
      bug = {
        raw = "[!BUG]",
        rendered = "󰨰 Bug",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      }, -- 缺陷
      example = {
        raw = "[!EXAMPLE]",
        rendered = "󰉹 Example",
        highlight = "RenderMarkdownHint",
        category = "obsidian",
      }, -- 示例
      quote = {
        raw = "[!QUOTE]",
        rendered = "󱆨 Quote",
        highlight = "RenderMarkdownQuote",
        category = "obsidian",
      }, -- 引用
      cite = {
        raw = "[!CITE]",
        rendered = "󱆨 Cite",
        highlight = "RenderMarkdownQuote",
        category = "obsidian",
      }, -- 引证
    },

    link = { -- 链接图标渲染配置
      enabled = true, -- 是否渲染行内链接图标
      render_modes = false, -- 额外渲染的模式
      footnote = { -- 脚注链接（^ 开头）
        enabled = true, -- 是否渲染脚注
        icon = "󰯔 ", -- 脚注图标
        body = function(ctx) -- 自定义脚注显示内容
          return ctx.text -- 默认显示原文本
        end,
        superscript = true, -- 是否替换为上标形式
        prefix = "", -- 脚注内容前缀
        suffix = "", -- 脚注内容后缀
      },
      image = "󰥶 ", -- 图片元素图标
      image_custom = true, -- 图片是否走 custom pattern 检查
      email = "󰀓 ", -- 邮箱自动链接图标
      hyperlink = "󰌹 ", -- 普通链接的回退图标
      highlight = "RenderMarkdownLink", -- 图标回退高亮组
      highlight_title = "RenderMarkdownLinkTitle", -- 链接标题高亮组
      wiki = { -- WikiLink（[[...]]）配置
        enabled = true, -- 是否渲染 WikiLink
        icon = "󱗖 ", -- WikiLink 图标
        conceal_destination = true, -- 有别名时是否隐藏目标地址
        body = function() -- 自定义 WikiLink 显示内容
          return nil -- 默认不覆盖
        end,
        highlight = "RenderMarkdownWikiLink", -- WikiLink 图标高亮组
        scope_highlight = nil, -- WikiLink 关联内容高亮组
      },
      custom = { -- 按目标地址匹配的自定义链接图标
        web = { icon = "󰖟 ", pattern = "^http" }, -- 以 http 开头的网址
        apple = { icon = " ", pattern = "apple%.com", kind = "url" }, -- 苹果
        discord = { icon = "󰙯 ", pattern = "discord%.com", kind = "url" }, -- Discord
        github = { icon = "󰊤 ", pattern = "github%.com", kind = "url" }, -- GitHub
        gitlab = { icon = "󰮠 ", pattern = "gitlab%.com", kind = "url" }, -- GitLab
        google = { icon = "󰊭 ", pattern = "google%.com", kind = "url" }, -- Google
        hackernews = { icon = " ", pattern = "ycombinator%.com", kind = "url" }, -- Hacker News
        linkedin = { icon = "󰌻 ", pattern = "linkedin%.com", kind = "url" }, -- LinkedIn
        microsoft = { icon = " ", pattern = "microsoft%.com", kind = "url" }, -- 微软
        neovim = { icon = " ", pattern = "neovim%.io", kind = "url" }, -- Neovim
        reddit = { icon = "󰑍 ", pattern = "reddit%.com", kind = "url" }, -- Reddit
        slack = { icon = "󰒱 ", pattern = "slack%.com", kind = "url" }, -- Slack
        stackoverflow = { icon = "󰓌 ", pattern = "stackoverflow%.com", kind = "url" }, -- Stack Overflow
        steam = { icon = " ", pattern = "steampowered%.com", kind = "url" }, -- Steam
        twitter = { icon = " ", pattern = "twitter%.com", kind = "url" }, -- Twitter
        wikipedia = { icon = "󰖬 ", pattern = "wikipedia%.org", kind = "url" }, -- 维基百科
        x = { icon = " ", pattern = "x%.com", kind = "url" }, -- X
        youtube = { icon = "󰗃 ", pattern = "youtube[^.]*%.com", kind = "url" }, -- YouTube
        youtube_short = { icon = "󰗃 ", pattern = "youtu%.be", kind = "url" }, -- YouTube 短链
      },
    },

    sign = { -- 标记列（sign column）配置
      enabled = true, -- 是否渲染标记
      priority = nil, -- 标记优先级
      highlight = "RenderMarkdownSign", -- 标记文本背景高亮组
    },

    inline_highlight = { -- 行内高亮配置（==文本== 形式，模仿 Obsidian）
      enabled = true, -- 是否渲染行内高亮
      render_modes = false, -- 额外渲染的模式
      highlight = "RenderMarkdownInlineHighlight", -- 被包裹文本的背景高亮组
      custom = {}, -- 基于文本前缀的自定义高亮
    },

    indent = { -- org 风格缩进配置（按标题层级缩进正文）
      enabled = false, -- 是否启用 org-indent 模式
      render_modes = false, -- 额外渲染的模式
      per_level = 2, -- 每个标题层级增加的缩进量
      skip_level = 1, -- 小于等于该值的标题层级不缩进（0 表示从第一级就缩进）
      skip_heading = false, -- 是否只缩进正文而不缩进标题
      icon = "▎", -- 缩进时添加的前缀字符（每层一个）
      priority = 0, -- extmark 优先级
      highlight = "RenderMarkdownIndent", -- 缩进字符高亮组
    },

    html = { -- HTML 渲染配置
      enabled = true, -- 是否启用 HTML 渲染
      render_modes = false, -- 额外渲染的模式
      comment = { -- HTML 注释处理
        conceal = true, -- 是否隐藏 HTML 注释
        text = nil, -- 隐藏注释前内联显示的文本
        highlight = "RenderMarkdownHtmlComment", -- 内联文本高亮组
      },
      tag = {}, -- 需隐藏首尾并显示图标的 HTML 标签映射
    },

    win_options = { -- 渲染/原始视图切换时使用的窗口选项
      conceallevel = { -- :h 'conceallevel'
        default = vim.o.conceallevel, -- 非渲染时的值（取用户设置）
        rendered = 3, -- 渲染时的值（3 表示完全隐藏被隐藏文本）
      },
      concealcursor = { -- :h 'concealcursor'
        default = vim.o.concealcursor, -- 非渲染时的值（取用户设置）
        rendered = "", -- 渲染时的值（空表示所有模式都显示原文）
      },
    },

    overrides = { -- 更细粒度的覆盖机制（按 buffer 属性差异化配置）
      buflisted = {}, -- 按 buflisted 值覆盖
      buftype = { -- 按 buftype 值覆盖
        nofile = { -- nofile 类型 buffer（如浮窗）
          render_modes = true, -- 该类型下所有模式都渲染
          padding = { highlight = "NormalFloat" }, -- 填充高亮改为浮窗背景
          sign = { enabled = false }, -- 关闭标记列
        },
      },
      filetype = {}, -- 按 filetype 值覆盖
      preview = { -- 预览 buffer 覆盖
        render_modes = true, -- 预览时所有模式都渲染
      },
    },

    custom_handlers = {}, -- treesitter 语言到自定义 handler 的映射

    yaml = { -- YAML front matter 渲染配置
      enabled = true, -- 是否启用 YAML 渲染
      render_modes = false, -- 额外渲染的模式
    },
  },
}

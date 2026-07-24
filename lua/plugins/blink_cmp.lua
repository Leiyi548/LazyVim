return {
  "saghen/blink.cmp",
  dependencies = { "Leiyi548/blink_cmp_im_zhh" },
  opts = function(_, opts)
    -- opts.fuzzy = { implementation = "lua" } -- 使用 lua 去匹配 fuzzy，没有原生流畅，非常卡顿
    -- 注册 IM source
    opts.sources = opts.sources or {}
    opts.sources.default = vim.list_extend(opts.sources.default or {}, { "blink_im_zhh" })
    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.blink_im_zhh = {
      name = "虎码",
      module = "blink-im-zhh",
      opts = { enable = false, maxn = 2 }, -- maxn 与 max_items 对齐，少算候选
      max_items = 2, -- ← force only 2 items in the menu
      score_offset = 1000, -- 高于 lazydev(100)/codecompanion(10)/path(3)/buffer(-3)，IM 候选排第一
      -- 默认只在 cmdline / snacks 输入框启用：那里虎码是唯一的 source，打快也不卡；
      -- 普通 buffer 默认不挂，避免和 LSP/path/buffer 多 source 抢事件循环导致高速输入跟不上。
      -- 需要时在普通 buffer 用 <C-.> 手动开（im.config.enable=true 即纳入）。
      enabled = function()
        local ok, im = pcall(require, "blink-im-zhh")
        local im_on = ok and im.config and im.config.enable
        if vim.api.nvim_get_mode().mode == "t" then
          -- 终端模式：仅在 floaterm 且虎码已开时启用（不污染其它终端/REPL）
          return im_on and vim.bo[vim.api.nvim_get_current_buf()].filetype == "floaterm"
        end
        if im_on then
          return true
        end
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        end
        local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
        return ft == "snacks_picker_input"
      end,
    }
    -- 普通 buffer 且开启虎码时，只保留 虎码 + buffer + path，关掉 lsp（含 lazydev 等 lsp 后端），
    -- 否则 lsp 每键触发会把事件循环压住，导致高速输入跟不上。
    local function im_on_in_normal_buffer()
      local ok, im = pcall(require, "blink-im-zhh")
      if not (ok and im.config and im.config.enable) then
        return false
      end
      if vim.api.nvim_get_mode().mode == "c" then
        return false
      end
      local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
      return not (ft == "snacks_picker_input" or ft == "snacks_input" or ft == "snacks_terminal")
    end
    -- lsp 是内置 provider，需 merge 保留 module，不能直接覆盖
    opts.sources.providers.lsp = vim.tbl_deep_extend(
      "force",
      {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
        fallbacks = { "buffer" },
      },
      opts.sources.providers.lsp or {},
      {
        enabled = function()
          return not im_on_in_normal_buffer()
        end,
      }
    )
    if opts.sources.providers.lazydev then
      opts.sources.providers.lazydev = vim.tbl_deep_extend("force", opts.sources.providers.lazydev, {
        enabled = function()
          return not im_on_in_normal_buffer()
        end,
      })
    end

    -- 仅在 snacks 输入框里出虎码，屏蔽 lsp/path/buffer 等其它源
    opts.sources.per_filetype = opts.sources.per_filetype or {}
    opts.sources.per_filetype.snacks_picker_input = { "blink_im_zhh" }
    opts.sources.per_filetype.snacks_input = { "blink_im_zhh" }
    opts.cmdline = {
      enabled = true,
      sources = function()
        -- cmdline 模式启用虎码,path source，buffer source 不生效
        return { "blink_im_zhh", "path", "cmdline" }
      end,
      completion = { documentation = { auto_show = true }, menu = { auto_show = true } },
      keymap = {
        -- 和 insert 模式保持一致的快捷键
        ["<Up>"] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.select_prev()
              return true
            end
            return false
          end,
          "fallback",
        },
        ["<Down>"] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.select_next()
              return true
            end
            return false
          end,
          "fallback",
        },
        ["<Space>"] = {
          function(cmp)
            if require("blink-im-zhh").getStatus() and cmp.is_visible() then
              local item = require("blink.cmp.completion.list").get_selected_item()
              if item and item.source_name == "虎码" then
                cmp.accept()
                return true
              end
            end
            return false
          end,
          "fallback",
        },
        ["<CR>"] = {
          function(cmp)
            if require("blink-im-zhh").getStatus() and cmp.is_visible() then
              local item = require("blink.cmp.completion.list").get_selected_item()
              if item and item.source_name == "虎码" then
                -- 输入法候选：取消补全，只上屏编码
                cmp.cancel()
                return true
              end
              -- 其它来源（如 LSP）：确认补全第一项
              cmp.accept()
              return true
            end
            return false
          end,
          "fallback",
        },
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.select_and_accept()
              return true
            end
            return false
          end,
          "fallback",
        },
      },
    }

    -- terminal 模式（floaterm）：开启 blink.cmp + 虎码，便于在终端里打中文
    opts.term = {
      enabled = true,
      sources = { "blink_im_zhh" },
      keymap = {
        -- 终端里 Space/Enter 要留给命令行（空格、回车执行命令），故用 <C-y> 上屏中文，
        -- <Up>/<Down>/<C-p>/<C-n> 选择候选，<C-e> 取消补全菜单
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-e>"] = { "hide", "fallback" },
      },
      completion = {
        documentation = { auto_show = false },
        list = {
          selection = { auto_insert = false },
        },
      },
    }

    -- 注意：不要整体覆盖 opts.completion，否则会丢掉 LazyVim 默认的 documentation 配置
    opts.completion = opts.completion or {}
    opts.completion.menu = {
      draw = {
        columns = {
          { "kind_icon", "label", "label_description" },
          { "my_kind" },
          { "my_source" },
        },
        components = {
          my_kind = {
            text = function(ctx)
              -- ctx.label 是 kind 的名称字符串，如 "Function"
              return "(" .. (ctx.kind or "") .. ")"
            end,
            width = { max = 20 },
            highlight = function(ctx)
              return ctx.kind_hl
            end,
          },
          my_source = {
            text = function(ctx)
              -- ctx.item.source_name 包含 source 名称
              return "[" .. (ctx.item.source_name or "") .. "]"
            end,
            width = { max = 20 },
          },
        },
      },
    }
    -- 默认自动显示补全文档（blink.cmp 官方默认值 auto_show = false，需手动打开）
    opts.completion.documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
    }
    -- IM 候选不需要文档：开启虎码时关闭补全文档弹窗（顺带省去每次按键的 doc 解析/定时器开销），
    -- 关闭虎码后恢复 LSP 等文档弹窗。blink 的 auto_show 只接受布尔，故用 toggle 联动。
    do
      local ok, im = pcall(require, "blink-im-zhh")
      if ok and im and im.toggle and not im._toggle_wrapped then
        local orig_toggle = im.toggle
        im.toggle = function()
          local enabled = orig_toggle()
          local ok2, bcfg = pcall(require, "blink.cmp.config")
          if ok2 and bcfg.completion then
            bcfg.completion.documentation.auto_show = not enabled
          end
          return enabled
        end
        im._toggle_wrapped = true
      end
    end

    -- 进入终端（含 floaterm 跑的 fzf 等 TUI）时，清掉该 buffer 残留的 _insert_start 边界。
    -- 原因：floaterm 会复用终端 buffer，上次在里头跑 shell 时记的 _insert_start 是一个很大的列值；
    -- 换 fzf 后输入行很短，边界把整行输入都跳过 → 虎码 key 为空 → 整个菜单消失。
    -- 而手动关/开虎码会让 M.toggle 把 _insert_start 重写回当前光标列，所以“关了重开又有了”。
    -- 终端输入没有“插入起点”概念，直接用整行做编码即可。
    vim.api.nvim_create_autocmd("TermEnter", {
      callback = function()
        local ok, im = pcall(require, "blink-im-zhh")
        if ok and im.config then
          im.config._insert_start = im.config._insert_start or {}
          im.config._insert_start[vim.api.nvim_get_current_buf()] = nil
        end
      end,
    })

    -- <Space> / <CR> 只在补全菜单可见 + IM 开 + 选中 IM 候选时拦截
    opts.keymap = opts.keymap or {}
    opts.keymap.preset = "default"
    opts.keymap["<Up>"] = {
      function(cmp)
        if cmp.is_visible() then
          cmp.select_prev()
          return true
        end
        return false
      end,
      "fallback",
    }
    opts.keymap["<Down>"] = {
      function(cmp)
        if cmp.is_visible() then
          cmp.select_next()
          return true
        end
        return false
      end,
      "fallback",
    }
    opts.keymap["<Space>"] = {
      function(cmp)
        if require("blink-im-zhh").getStatus() and cmp.is_visible() then
          local item = require("blink.cmp.completion.list").get_selected_item()
          if item and item.source_name == "虎码" then
            cmp.accept() -- 上屏中文
            return true
          end
        end
        return false -- 否则 fallback：输入空格
      end,
      "fallback",
    }
    opts.keymap["<CR>"] = {
      function(cmp)
        if require("blink-im-zhh").getStatus() and cmp.is_visible() then
          local item = require("blink.cmp.completion.list").get_selected_item()
          if item and item.source_name == "虎码" then
            cmp.cancel() -- 保留编码，不提交中文，不换行
            return true
          end
        else
          if cmp.is_visible() then
            cmp.accept() -- 不在虎码输人法时，就上屏第一个选项
            return true
          elseif vim.bo.filetype == "snacks_picker_input" then -- 如果在 snacks_picker_input 按一次回车就行了！
            local p = Snacks.picker.get({ tab = true })[1]
            if p then
              p:action("confirm")
            end
          end
        end
        return false -- 否则 fallback：正常回车
      end,
      "fallback",
    }
    --  <Tab> selects and accepts the first item
    opts.keymap["<Tab>"] = {
      function(cmp)
        if cmp.is_visible() then
          cmp.select_and_accept()
          return true
        end
        return false
      end,
      "snippet_forward",
      "fallback",
    }
    -- 在特定文件里启用 blink-cmp-zhh,这样真得很爽啊!
    opts.enabled = function()
      if
        require("blink-im-zhh").getStatus() and vim.bo.filetype == "snacks_picker_input"
        or vim.bo.filetype == "snacks_input"
        or vim.bo.filetype == "snacks_terminal"
      then
        return "force" -- 忽略默认禁用条件，强制启用
      end
      return true -- 其他 filetype 按默认
    end
  end,
}

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
      opts = { enable = false },
      max_items = 2, -- ← force only 2 items in the menu
      score_offset = 1000, -- 高于 lazydev(100)/codecompanion(10)/path(3)/buffer(-3)，IM 候选排第一
    }
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
      completion = { menu = { auto_show = true } },
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
                cmp.cancel()
                return true
              end
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

    opts.completion = {
      menu = {
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
      },
    }

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

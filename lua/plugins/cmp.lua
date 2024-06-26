return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "Leiyi548/cmp_im_zhh",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      enabled = function()
        local filetype = vim.api.nvim_buf_get_option(0, "filetype")
        if filetype == "TelescopePrompt" then
          return require("cmp_im").getStatus()
        end
        return true
      end,
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          -- border = "rounded",
        },
        documentation = {
          -- border = "rounded",
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Space>"] = cmp.mapping(require("cmp_im").select(), { "i" }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<End>"] = cmp.mapping.abort(),
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping(require("cmp_im").confirmEnter(), { "i" }),
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "IM", priority = 999 },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          if entry.source.name == "IM" then
            -- item.kind = icons[item.kind] .. item.kind
            item.kind = "(" .. item.kind .. ")"
            item.menu = " [" .. "虎码" .. "]"
          else
            -- item.kind = icons[item.kind] .. item.kind
            item.kind = "(" .. item.kind .. ")"
            item.menu = " [" .. entry.source.name .. "]"
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    local cmp = require("cmp")
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    cmp.setup(opts)
    -- `/` cmdline setup.
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline({
        ["<Space>"] = {
          c = function(fallback)
            local cmp_im = require("cmp_im")
            if cmp_im.getStatus() and cmp.visible() then
              local entries = cmp.get_entries()
              if #entries > 0 and entries[1].source.name == "IM" then
                return cmp.confirm({ select = true })
              end
            end
            return fallback()
          end,
        },
        ["<End>"] = {
          c = function(fallback)
            local cmp_im = require("cmp_im")
            if cmp_im.getStatus() and cmp.visible() then
              return cmp.abort()
            end
            return fallback()
          end,
        },
      }),
      sources = {
        { name = "buffer" },
        { name = "IM", priority = 999 },
      },
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline({ ":", "@" }, {
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = {
          c = function(fallback)
            if cmp.visible() then
              return cmp.confirm({ select = true })
            end
            return fallback()
          end,
        },
        ["<Space>"] = {
          c = function(fallback)
            local cmp_im = require("cmp_im")
            if cmp_im.getStatus() and cmp.visible() then
              local entries = cmp.get_entries()
              if #entries > 0 and entries[1].source.name == "IM" then
                return cmp.confirm({ select = true })
              end
            end
            return fallback()
          end,
        },
        ["<End>"] = {
          c = function(fallback)
            local cmp_im = require("cmp_im")
            if cmp_im.getStatus() and cmp.visible() then
              return cmp.abort()
            end
            return fallback()
          end,
        },
      }),
      sources = require("cmp").config.sources({
        { name = "path" },
        { name = "IM", priority = 999 },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "yehuohan/cmp-im",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "TelscopePrompt" then
          return true
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
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Space>"] = cmp.mapping(require("cmp_im").select(), { "i" }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            if entry.source.name == "IM" then
              -- item.kind = icons[item.kind] .. item.kind
              item.kind = "(" .. item.kind .. ")"
              item.menu = " [" .. "虎" .. "]"
            else
              -- item.kind = icons[item.kind] .. item.kind
              item.kind = "(" .. item.kind .. ")"
              item.menu = " [" .. entry.source.name .. "]"
            end
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
      }),
      sources = {
        { name = "buffer" },
        { name = "IM" },
      },
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
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
      }),
      sources = require("cmp").config.sources({
        { name = "path" },
        { name = "IM" },
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

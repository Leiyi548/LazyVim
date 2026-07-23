-- 禁用 mason / nvim-lint / conform 中的 markdownlint-cli2
-- （markdown 这个 extra 仍然保留，仅移除 markdownlint-cli2 这一项）
return {
  -- 1) 不让 mason 自动安装 / 更新 markdownlint-cli2
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(name)
        return name ~= "markdownlint-cli2"
      end, opts.ensure_installed or {})
    end,
  },

  -- 2) 从 nvim-lint 移除 markdown 的 linter（否则打开 md 文件仍会尝试调用它）
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = nil
      opts.linters_by_ft["markdown.mdx"] = nil
    end,
  },

  -- 3) 从 conform 移除 markdown 的 formatter
  -- {
  --   "stevearc/conform.nvim",
  --   opts = function(_, opts)
  --     opts.formatters_by_ft = opts.formatters_by_ft or {}
  --     for _, ft in ipairs({ "markdown", "markdown.mdx" }) do
  --       if opts.formatters_by_ft[ft] then
  --         opts.formatters_by_ft[ft] = vim.tbl_filter(function(name)
  --           return name ~= "markdownlint-cli2"
  --         end, opts.formatters_by_ft[ft])
  --       end
  --     end
  --   end,
  -- },
}

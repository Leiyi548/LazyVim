return {
  "Leiyi548/blink_cmp_im_zhh", -- 仓库名，无所谓
  dependencies = { "saghen/blink.cmp" },
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    opts.sources.default = vim.list_extend(opts.sources.default or {}, { "blink_im_zhh" })
    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.blink_im_zhh = {
      name = "虎码", -- 显示在菜单里的 source 名
      module = "blink-im-zhh", -- ← 填模块名，不是 repo 名
      opts = { enable = false, maxn = 2 }, -- enable=false 需手动开；想自启改 true。maxn 与 max_items 对齐
    }
  end,
}

return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  config = function()
    require("snippets.all")
    require("snippets.gitcommit")
    require("snippets.markdown")
  end,
}

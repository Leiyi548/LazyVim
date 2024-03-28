return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      if vim.loop.os_uname().sysname == "Windows_NT" then
        local configDir = vim.fs.dirname(vim.api.nvim_get_runtime_file("lua/init.lua", false)[1])
        require("luasnip.loaders.from_vscode").lazy_load({
          paths = string.format("%s/%s", configDir, "snippets"),
        })
      end
    end,
  },
}

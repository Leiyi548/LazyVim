return {
  {
    "Leiyi548/flash-zhh.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/flash.nvim",
    },
    keys = {
      {
        "s",
        mode = { "n", "x" },
        function()
          require("flash-zhh").jump()
        end,
        desc = "Flash between Chinese",
      },
      {
        "r",
        mode = { "o" },
        function()
          require("flash-zhh").remote()
        end,
        desc = "Flash between Chinese",
      },
    },
  },
}

return {
  {
    "Leiyi548/flash-zhh.nvim",
    dependencies = "folke/flash.nvim",
    keys = {
      {
        "S",
        mode = { "n" },
        function()
          require("flash-zhh").jump()
        end,
        desc = "Flash between Chinese(tiger code)",
      },
    },
  },
}

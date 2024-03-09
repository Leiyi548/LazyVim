return {
  {
    "Leiyi548/flash-zhh.nvim",
    dependencies = "Leiyi548/flash.nvim",
    keys = {
      {
        ";s",
        mode = { "n", "x" },
        function()
          require("flash-zhh").jump()
        end,
        desc = "Flash between Chinese(tiger code)",
      },
      {
        ";s",
        mode = { "o" },
        function()
          require("flash-zhh").remote()
        end,
        desc = "Flash between Chinese(tiger code)",
      },
    },
  },
}

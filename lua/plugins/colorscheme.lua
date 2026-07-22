return {
  {
    "neanias/everforest-nvim",
    version = false, -- 始终使用最新的版本
    lazy = true,
    config = function ()
      require("everforest").setup({
        --- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        --- Default is "medium".
        background = "hard",
        on_highlights = function (hl,palette)
          -- flash
          hl.FlashLabel = {fg="#222222", bg=palette.green, bold = true }
        end
      })
    end
  },
}

-- https://github.com/voldikss/vim-translator
return {
  "voldikss/vim-translator",
  cmd = "Translate",
  cofing = function()
    vim.g.translator_target_lang = "zh"
    vim.g.translator_source_lang = "auto"
    vim.g.translator_window_type = "popup"
  end,
  keys = {
    -- stylua: ignore start
      { "<leader>tw","<cmd>Translate<cr>" , desc = "Translate the word under the cursor"},
      { "<leader>th","<cmd>TranslateH<cr>" , desc = "Export the translation history"},
    -- stylua: ignore end
  },
}

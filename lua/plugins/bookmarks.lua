return {
  "LintaoAmons/bookmarks.nvim",
  cmd = { "BookmarksGoto", "BookmarksMark" },
  config = function()
    require("bookmarks").setup({
      json_db_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/bookmarks.db.json"),
    })
  end,
  keys = {
    { "ma", "<cmd>BookmarksMark<cr>", desc = "Mark current line into active BookmarkList" },
    { "ms", "<cmd>BookmarksGoto<cr>", desc = "Go to bookmarks at current BookmarkList" },
  },
}

return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gedit", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
  keys = {
    -- stylua: ignore start
    { "<leader>gt", "<cmd>G<cr>", desc = "[G]it s[t]atus(fugitive)", },
    { "<leader>gT", "<cmd>tab G<cr>", desc = "Open fugitive in new tab", },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Open Git Log", },
    -- stylua: ignore end
  },
  dependencies = {
    "skywind3000/asyncrun.vim",
    cmd = "AsyncRun",
    config = function()
      vim.g.asyncrun_bell = 1
    end,
  },
  config = function()
    vim.cmd([[
      command! -bang -bar -nargs=* Gpush execute 'AsyncRun<bang> -cwd=' .
                \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
      command! -bang -bar -nargs=* Gfetch execute 'AsyncRun<bang> -cwd=' .
                \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>
    ]])
  end,
}

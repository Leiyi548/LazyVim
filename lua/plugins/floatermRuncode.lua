return {
  {
    "skywind3000/asynctasks.vim",
    cmd = { "AsyncTask" },
    dependencies = {
      { "skywind3000/asyncrun.vim", cmd = { "AsyncRun" } },
      {
        "voldikss/vim-floaterm",
        cmd = {
          "FloatermNew",
          "FloatermPrev",
          "FloatermNext",
          "FloatermFirst",
          "FloatermLast",
          "FloatermLast",
          "FloatermToggle",
          "FloatermHidden",
          "FloatermKill",
          "FloatermSend",
        },
        config = function()
          vim.cmd([[hi FloatermNC guibg=gray]])
          -- 注：floaterm 的 shell 改为 pwsh 的设置放在 lua/config/options.lua
          -- （需先于 vim-floaterm 的 plugin 文件执行，避免懒加载时机问题）。
          vim.g.floaterm_width = 0.9
          vim.g.floaterm_wintype = "float"
          vim.g.floaterm_height = 0.9
          -- 标题模板（作为兜底；真正动态标题由下方 autocmd 改写）
          vim.g.floaterm_title = "floaterm [$1/$2]"

          -- 计算并改写当前 floaterm 的边框标题：
          --   目录（随切换动态变化） + name + 第几个/共几个
          vim.cmd([[
          function! FloatermDynamicTitleRefresh() abort
            if &filetype !=# 'floaterm' | return | endif
            let bufnr = bufnr('%')
            let buffers = floaterm#buflist#gather()
            let cnt = len(buffers)
            let idx = index(buffers, bufnr) + 1
            " 当前 floaterm 的工作目录（创建时指定了 --cwd 才记录，否则回退到 getcwd）
            let cwd = getbufvar(bufnr, 'floaterm_cwd', '')
            if empty(cwd) | let cwd = getcwd() | endif
            let cwd = substitute(cwd, '\\', '/', 'g')
            let home = substitute(expand('$HOME'), '\\', '/', 'g')
            let cwd = substitute(cwd, '^' . home, '~', '')
            " 当前 floaterm 的 name（未命名时回退为缓冲区编号）
            let nm = getbufvar(bufnr, 'floaterm_name', '')
            if empty(nm) | let nm = '#' . bufnr | endif
            let title = cwd . ' [' . nm . '] [' . idx . '/' . cnt . ']'
            " 改写边框首行
            let bdwin = getbufvar(bufnr, 'floaterm_borderwinid', -1)
            if bdwin != -1
              let bd_buf = winbufnr(bdwin)
              if bd_buf == -1 | return | endif
              let borderchars = getbufvar(bufnr, 'floaterm_borderchars', ['─','│','─','│','╭','╮','╯','╰'])
              let titleposition = getbufvar(bufnr, 'floaterm_titleposition', 'left')
              let repeat_width = nvim_win_get_width(bdwin) - 2
              let top_line = floaterm#buffer#create_top_border({'title': title, 'borderchars': borderchars, 'titleposition': titleposition}, repeat_width)
              " border 缓冲区默认 nomodifiable，写之前临时打开
              call setbufvar(bd_buf, '&modifiable', 1)
              call setbufline(bd_buf, 1, borderchars[4] . top_line . borderchars[5])
              call setbufvar(bd_buf, '&modifiable', 0)
            else
              " 使用 nvim 原生 winborder 的情况
              let winid = getbufvar(bufnr, 'floaterm_winid', -1)
              if winid != -1
                call nvim_win_set_option(winid, 'title', title)
              endif
            endif
          endfunction
          ]])
          vim.cmd([[
          augroup floaterm_dynamic_title
            autocmd!
            autocmd User FloatermOpen call FloatermDynamicTitleRefresh()
          augroup END
          ]])
          vim.g.floaterm_titleposition = "left" -- left/center/right
          vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
        end,
        keys = {
          { "<F2>", "<cmd>FloatermToggle<cr>", desc = "Toggle floaterm", mode = { "n", "x", "i", "t" } },
        }
      },
    },
    config = function()
      vim.g.asynctasks_term_pos = "bottom"
      vim.g.asynctasks_term_cols = 60
      vim.g.asynctasks_term_rows = 12
      vim.g.asyncrun_open = 6
      vim.cmd([[
        let g:asynctasks_extra_config = vim.fn.stdpath("config") + "/tasks.ini"
        ]])
    end,
  },
}

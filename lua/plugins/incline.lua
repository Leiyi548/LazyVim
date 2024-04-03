local field_format = {
  name = {
    guifg = "#a0a0a0",
    guibg = "#282828",
  },
  num = {
    guifg = "#968c81",
  },
  modified = {
    guifg = "#d6991d",
  },
  blocks = {
    gui = "bold",
    guifg = "#070707",
  },
}

return {
  {
    "b0o/incline.nvim",
    -- Optional: Lazy load Incline
    event = "VeryLazy",
    enabled = false,
    config = function()
      -- more information please see https://github.com/b0o/incline.nvim/discussions/32
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          -- buffer name
          local buffullname = vim.api.nvim_buf_get_name(props.buf)
          local bufname_t = vim.fn.fnamemodify(buffullname, ":t")
          local bufname = (bufname_t and bufname_t ~= "") and bufname_t or "[No Name]"
          local display_bufname = vim.tbl_extend("force", { bufname, " " }, field_format.name)
          local modified_icon = {}
          if vim.api.nvim_get_option_value("modified", { buf = props.buf }) then
            modified_icon = vim.tbl_extend("force", { "● " }, field_format.modified)
            display_bufname.guifg = field_format.modified.guifg
          end
          local window_number = { " " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" }
          return {
            window_number,
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            display_bufname,
            modified_icon,
          }
        end,
      })
    end,
  },
}

local M = {}

function M.make_beancount()
  local Menu = require("nui.menu")
  local event = require("nui.utils.autocmd").event

  local menu = Menu({
    position = "50%",
    size = {
      width = 25,
      height = 5,
    },
    border = {
      style = "single",
      text = {
        top = "[选择你想要记账的账单]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    lines = {
      Menu.item("支付宝"),
      Menu.item("银行卡"),
      Menu.item("微信"),
      Menu.item("现金"),
      Menu.item("京东"),
    },
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>", "q" },
      submit = { "<CR>", "<Space>" },
    },
    on_close = function() end,
    on_submit = function(item)
      print("Menu Submitted: ", item.text)
      local mybeancountDict = {
        ["微信"] = "wechat",
        ["支持宝"] = "alipay",
        ["现金"] = "cash",
        ["银行卡"] = "bank",
        ["京东"] = "jingdong",
      }
      local current_account = mybeancountDict[item.text]
      local mybeancountRepo = "D:\\myGithub\\mybeancount\\"
      vim.api.nvim_set_current_dir(mybeancountRepo)
      local year = os.date("%Y")
      local month = os.date("%m")
      local mybeancountFile = mybeancountRepo .. year .. "\\" .. month .. "_" .. current_account .. ".bean"
      vim.cmd("e " .. mybeancountFile)
    end,
  })

  -- mount the component
  menu:mount()
end

return M

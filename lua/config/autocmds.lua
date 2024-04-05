-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "fugitive",
    "git",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("fugitive_keymap"),
  pattern = {
    "fugitive",
  },
  callback = function(ctx)
    -- git commit vertical split
    vim.keymap.set("n", "cvv", "<cmd>vert Git commit -v<cr>", { remap = true, buffer = ctx.buf })
    vim.keymap.set("n", "<Tab>", "=", { remap = true, buffer = ctx.buf })
    vim.keymap.set("n", "t", "-", { remap = true, buffer = ctx.buf })
    vim.keymap.set("n", "a", function()
      local sid = require("utils.fugitive").get_sid()
      local func = "Do"
      vim.fn[string.format("<SNR>%d_%s", sid, func)]("Stage", 0)
    end, { remap = true, buffer = ctx.buf })
    vim.keymap.set("x", "a", "s", { remap = true, buffer = ctx.buf })
    -- stylua: ignore
    vim.keymap.set("n", "s", function() require("flash-zhh").jump() end, { buffer = ctx.buf })
    vim.keymap.set("n", "dd", function()
      local info = require("utils.fugitive").get_status_cursor_info()
      if info then
        vim.cmd(string.format("DiffviewOpen --selected-file=%s", vim.fn.fnameescape(info.paths[1])))
      end
    end, { remap = true, buffer = ctx.buf, desc = "open diffview in new tab" })
    vim.keymap.set("n", "P", function()
      local choice = vim.fn.confirm(
        string.format("是否要 Push 到远程(%s)分支", vim.fn.FugitiveHead()):format(vim.fn.bufname()),
        "&Yes\n&No\n&Cancel",
        1
      )
      if choice == 1 then
        vim.cmd("Git push")
      end
    end, { remap = true, buffer = ctx.buf, desc = "Git Push" })
  end,
})

-- close tab
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_tab_with_q"),
  pattern = {
    "DiffviewFiles",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>tabclose<cr>", { buffer = event.buf, silent = true })
  end,
})

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
  callback = function()
    vim.cmd([[
      map <silent> <buffer> <TAB> =
    ]])
  end,
})

local function is_zhh_entry(entry)
  return vim.tbl_get(entry, "source", "name") == "IM"
end

local function text_edit_range_length(entry)
  local range = entry.completion_item.textEdit.insert
  return range["end"].character - range.start.character
end

local chinese_symbol_table = {
  "？",
  "（",
  "）",
  "→",
  "·",
  "~",
  "——",
  "〖",
  "〗",
  "！",
  "……",
  "、",
  "“",
  "”",
  "『",
  "』",
  "￥",
  "%",
  "|",
  "【",
  "】",
  "《",
  "》",
  "「",
  "」",
}
local function contain_chinese_symbol(value)
  for i = 1, #chinese_symbol_table do
    if chinese_symbol_table[i] == value then
      return true
    end
  end
  return false
end

local zhh_auto_confirm = vim.schedule_wrap(function()
  local cmp = require("cmp")
  if not require("cmp_im").getStatus() then
    return
  end
  local selected_entry = cmp.get_selected_entry()
  if selected_entry == nil then
    selected_entry = cmp.get_first_entry()
  end
  local newText = selected_entry.completion_item.textEdit.newText
  if selected_entry ~= nil and is_zhh_entry(selected_entry) and contain_chinese_symbol(newText) then
    cmp.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  end
end)

-- vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
--   callback = function()
--     -- check completion
--     zhh_auto_confirm()
--   end,
-- })

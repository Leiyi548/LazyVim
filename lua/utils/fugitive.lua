local api = vim.api
local M = {
  sid_cache = {},
}

---Get the script ID of a fugitive script file.
---@return integer?
function M.get_sid()
  local script_entry = vim.api.nvim_exec("scriptnames", true)
  -- print(script_entry)
  local sid = tonumber(string.match(script_entry, "(%d+):%s+[^%c]+autoload\\fugitive%.vim"))
  -- print(vim.inspect(sid))
  return sid
end

---Call a fugitive function.
---@param func string Function name.
---@param ... any Arguments.
---@return unknown
function M.call(func, ...)
  local sid
  sid = M.get_sid()
  return vim.fn[string.format("<SNR>%d_%s", sid, func)](...)
end

---Get the fugitive context for the item under the cursor.
---@return table?
function M.get_status_cursor_info()
  if vim.bo.ft ~= "fugitive" then
    return
  end
  return M.call("StageInfo", api.nvim_win_get_cursor(0)[1])
end

return M

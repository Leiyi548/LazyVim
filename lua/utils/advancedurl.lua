local M = {}

local function markdownlint(vault, filepath)
  -- 参考 obsidian.lua 插件中的 open.lua 文件
  local uri = ("obsidian://advanced-uri?&vault=%s&filepath=%s&commandid=obsidian-linter:lint-file"):format(
    vault,
    filepath
  )
  uri = vim.fn.shellescape(uri)
  local cmd = "powershell"
  local args = { "Start-Process '" .. uri .. "'" }
  local cmd_with_args = cmd .. " " .. table.concat(args, " ")
  vim.fn.jobstart(cmd_with_args, {
    detach = true,
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        local err_msg = ("linter format command failed with exit code '%s': %s"):format(exit_code, cmd_with_args)
        vim.notify(err_msg)
      end
    end,
  })
end

local function openfile(vault, filepath)
  -- 参考 obsidian.lua 插件中的 open.lua 文件
  local uri = ("obsidian://advanced-uri?&vault=%s&filepath=%s"):format(vault, filepath)
  uri = vim.fn.shellescape(uri)
  local cmd = "powershell"
  local args = { "Start-Process '" .. uri .. "'" }
  local cmd_with_args = cmd .. " " .. table.concat(args, " ")
  vim.fn.jobstart(cmd_with_args, {
    detach = true,
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        local err_msg = ("open format command failed with exit code '%s': %s"):format(exit_code, cmd_with_args)
        vim.notify(err_msg)
      end
    end,
  })
end

function M.markdownlintCurrentFile()
  local pwd = vim.loop.cwd()
  local vault = vim.fs.basename(pwd)
  local current_file = vim.fn.expand("%:p")
  local relative_path = string.gsub(vim.fn.fnamemodify(current_file, ":~:."), "\\", "/")
  markdownlint(vault, relative_path)
end

function M.obsidianOpenCurrentFile()
  local pwd = vim.loop.cwd()
  local vault = vim.fs.basename(pwd)
  local current_file = vim.fn.expand("%:p")
  local relative_path = string.gsub(vim.fn.fnamemodify(current_file, ":~:."), "\\", "/")
  openfile(vault, relative_path)
end

return M

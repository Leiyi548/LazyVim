local M = {}

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local file_ignore_patterns = {
  -- disable directory
  "vendor/*",
  "fonts/*",
  ".git/*",
  "node_modules",
  ".obsidian",
  -- diable filetype
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  "a.out",
}

function M.findFile()
  local opts = {
    prompt_title = "findFile",
    file_ignore_patterns = file_ignore_patterns,
  }
  builtin.find_files(themes.get_dropdown(opts))
end

function M.findProjectFile()
  local opts = {
    prompt_title = "findProjectFile",
    cwd = vim.fn.stdpath("config"),
  }
  if
    vim.uv.fs_stat(vim.uv.cwd() .. "/.git")
    and not vim.uv.fs_stat(vim.uv.cwd() .. "/.ignore")
    and not vim.uv.fs_stat(vim.uv.cwd() .. "/.rgignore")
  then
    if opts.show_untracked == nil then
      opts.show_untracked = true
    end
    builtin = "git_files"
    opts.prompt_title = vim.uv.cwd() .. "(git_files)"
  else
    builtin = "find_files"
    opts.prompt_title = vim.uv.cwd() .. "(find_files)"
  end
  require("telescope.builtin")[builtin](themes.get_dropdown(opts))
end

function M.findConfigFile()
  local opts = {
    prompt_title = "Lazyvim config file",
    cwd = vim.fn.stdpath("config"),
    previewer = false,
  }
  builtin.find_files(themes.get_dropdown(opts))
end

function M.findRecentFile()
  local opts = {
    prompt_title = "Recent file",
    previewer = false,
  }
  builtin.oldfiles(themes.get_dropdown(opts))
end

function M.findBuffer()
  local opts = {
    sort_lastused = true,
    sort_mru = true,
    ignore_current_buffer = false,
    theme = "dropdown",
    previewer = false,
    mappings = {
      i = { ["<C-d>"] = actions.delete_buffer },
      n = {
        ["d"] = actions.delete_buffer,
        ["<C-d>"] = actions.delete_buffer,
      },
    },
  }
  builtin.buffers(themes.get_dropdown(opts))
end

function M.grep_string_by_filetype()
  local opts = {
    prompt_title = "Search for a specific file type",
    type_filter = vim.fn.input("FireType: "),
  }
  builtin.live_grep(themes.get_dropdown(opts))
end

return M

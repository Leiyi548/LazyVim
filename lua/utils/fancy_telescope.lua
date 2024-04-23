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

function M.findProjectFile()
  local builtin_picker = "find_files"
  local opts = {
    prompt_title = "",
    results_title = "Result(findProjectFile)",
    show_untracked = true,
    path_display = {
      filename_first = {
        reverse_directories = false,
      },
    },
  }
  if
    vim.uv.fs_stat(vim.uv.cwd() .. "/.git")
    and not vim.uv.fs_stat(vim.uv.cwd() .. "/.ignore")
    and not vim.uv.fs_stat(vim.uv.cwd() .. "/.rgignore")
  then
    builtin_picker = "git_files"
  else
    builtin_picker = "find_files"
  end
  opts.prompt_title = vim.uv.cwd() .. "(" .. builtin_picker .. ")"
  require("telescope.builtin")[builtin_picker](opts)
end

function M.findConfigFile()
  local opts = {
    prompt_title = "Lazyvim config file",
    cwd = vim.fn.stdpath("config"),
    -- cwd = "C:\\Users\\Alan\\AppData\\Local\\nvim",
    previewer = false,
    show_untracked = true,
  }
  builtin.git_files(themes.get_dropdown(opts))
end

function M.findConfigFileDashboard()
  local config_dir = vim.fn.stdpath("config")
  vim.api.nvim_set_current_dir(config_dir)
  local opts = {
    prompt_title = "Lazyvim config file(dashboard)",
    cwd = config_dir,
    -- cwd = "C:\\Users\\Alan\\AppData\\Local\\nvim",
    previewer = false,
    show_untracked = true,
  }
  builtin.git_files(themes.get_dropdown(opts))
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
    initial_mode = "normal",
    entry_maker = require("mytelescope.my_make_entry").gen_from_buffer_like_leaderf(),
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

function M.live_grep_project()
  local opts = {
    prompt_title = vim.uv.cwd(),
  }
  builtin.live_grep(opts)
end

function M.grep_string_by_filetype()
  local opts = {
    prompt_title = "Search for a specific file type",
    type_filter = vim.fn.input("FireType: "),
  }
  builtin.live_grep(opts)
end

function M.super_file_browser()
  local opts = {
    initial_mode = "normal",
    prompt_title = vim.uv.cwd() .. "(file_browser)",
  }
  require("telescope").extensions.file_browser.file_browser(opts)
end

return M

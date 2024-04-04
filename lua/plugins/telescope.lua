local Util = require("lazyvim.util")
local action_state = require("telescope.actions.state")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("fzf")
        end)
      end,
    },
    {
      "Leiyi548/project.nvim",
      opts = {
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = true,
        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { "pattern" },
        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      },
      event = "VeryLazy",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("lazyvim.util").on_load("telescope.nvim", function()
          require("telescope").load_extension("projects")
        end)
      end,
      keys = {
        { "<leader>pr", "<Cmd>ProjectRoot<CR>", desc = "ProjectRoot" },
        { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        { "<leader>fo", "<Cmd>Telescope oil<CR>", desc = "oil Projects" },
        { "<leader>fg", "<Cmd>Telescope projectGrep<CR>", desc = "projectGrep" },
      },
    },
  },
  keys = {
    { "<leader>,", false },
    -- 这个太伤我的小拇指了
    { "<leader>/", false },
    -- 冲突
    { "<leader>fg", false },
    -- { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader><space>", false },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    -- { "<leader>fc", Util.telescope.config_files(), desc = "Find Config File" },
    { "<leader>fc", false },
    { "<leader>fr", false },
    -- { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", false },
    { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    -- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    -- search
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>sg", false },
    -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
    { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
    { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
    { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
    { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = function()
    local actions = require("telescope.actions")

    local open_with_trouble = function(...)
      return require("trouble.sources.telescope").open(...)
    end

    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end

    local find_files_no_ignore = function()
      local line = action_state.get_current_line()
      Util.telescope("find_files", { no_ignore = true, default_text = line })()
    end

    local find_files_with_hidden = function()
      local line = action_state.get_current_line()
      Util.telescope("find_files", { hidden = true, default_text = line })()
    end

    local function flash(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending", -- 按照升序排序
        layout_config = {
          horizontal = { prompt_position = "top" },
          vertical = { prompt_position = "top", mirror = true },
        },
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            ["<c-q>"] = open_with_trouble,
            ["<c-s>"] = flash,
            ["<a-t>"] = open_selected_with_trouble,
            ["<a-i>"] = find_files_no_ignore,
            ["<a-h>"] = find_files_with_hidden,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-b>"] = actions.preview_scrolling_left,
            ["<Left>"] = actions.preview_scrolling_left,
            ["<C-f>"] = actions.preview_scrolling_right,
            ["<Right>"] = actions.preview_scrolling_right,
          },
          n = {
            ["<c-q>"] = open_with_trouble,
            ["q"] = actions.close,
            ["<c-s>"] = flash,
            ["<C-b>"] = actions.preview_scrolling_left,
            ["<C-f>"] = actions.preview_scrolling_right,
          },
        },
      },
      pickers = {
        lsp_definitions = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "dropdown",
        },
        git_status = {
          theme = "dropdown",
        },
        buffers = {
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
        },
        current_buffer_fuzzy_find = {
          skip_empty_lines = true,
          layout_strategy = "vertical",
          previewer = true,
          mappings = {
            i = {
              ["<C-y>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.fn.setreg("*", selection.text)
                vim.notify("复制成功：" .. selection.text)
              end,
            },
          },
        },
        git_commits = {
          layout_strategy = "vertical",
          mappings = {
            i = {
              -- checkout commit
              -- ["<C-o>"] = actions.git_checkout,
              -- 复制 commit 信息
              ["<cr>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection == nil then
                  vim.notify("没有可以选择的 commit")
                else
                  actions.close(prompt_bufnr)
                  -- yanks the additions from the currently selected undo state into the default register
                  vim.fn.setreg("*", selection.msg)
                  vim.notify(selection.msg)
                end
              end,
              -- 复制 commit hash 值
              ["<C-y>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection == nil then
                  vim.notify("没有可以选择的 commit")
                else
                  actions.close(prompt_bufnr)
                  -- yanks the additions from the currently selected undo state into the default register
                  vim.fn.setreg("*", selection.value)
                  vim.notify(selection.value)
                end
              end,
            },
            n = {
              -- checkout commit
              ["<C-o>"] = actions.git_checkout,
              -- 复制 commit 信息
              ["<cr>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection == nil then
                  vim.notify("没有可以选择的 commit")
                else
                  actions.close(prompt_bufnr)
                  vim.fn.setreg("*", selection.msg)
                  vim.notify(selection.msg)
                end
              end,
              -- 复制 commit hash 值
              ["<C-v>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection == nil then
                  vim.notify("没有可以选择的 commit")
                else
                  actions.close(prompt_bufnr)
                  vim.fn.setreg("*", selection.value)
                  vim.notify(selection.value)
                end
              end,
            },
          },
        },
      },
    }
  end,
}

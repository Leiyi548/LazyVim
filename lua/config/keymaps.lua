-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- force delete buffer
-- stylua: ignore
map("n", "<leader>bx", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete word" })

-- 让 ctrl+delete 等于 ctrl+w 去删除光标前面的单词
map({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word" })

-- better paste
map({ "i" }, "<C-v>", "<C-r>*", { desc = "Paste" })

-- center current line
map({ "i" }, "<C-l>", "<C-o>zz", { desc = "center current line" })

-- 防止 visual mode p 的内容会替换剪贴板内容
map("x", "p", '"_dP')

-- Home End
map({ "n", "x", "o" }, "<S-h>", "0", { desc = "Home" })
map({ "n", "x", "o" }, "<S-l>", "$", { desc = "End" })

-- remove lazyvim Default keymap
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
-- vim.keymap.del({ "n", "x" }, "j")
-- vim.keymap.del({ "n", "x" }, "k")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("t", "<esc><esc>")
map("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- lsp
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LspInfo" })
map("n", "<leader>ll", "<cmd>LspLog<cr>", { desc = "LspLog" })
map("n", "<leader>ls", "<cmd>LspStop<cr>", { desc = "LspStop" })

-- dark light background keymap
map("n", "<leader>uD", "<cmd>set background=dark<cr>", { desc = "set dark background" })
map("n", "<leader>uL", "<cmd>set background=light<cr>", { desc = "set light background" })

-- :x
map("n", "<leader>qx", "<cmd>x<cr>", { desc = "save close window" })

-- delete a char
map({ "i", "c" }, "<C-d>", "<Del>", { desc = "delete a char" })

-- add empty lines before and after cursor line
map("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>", { desc = "Put empty line above" })
map("n", "go", "<cmd>call append(line('.'),     repeat([''], v:count1))<cr>", { desc = "Put empty line below" })

-- fast save
map({ "n", "i", "x" }, "<C-s>", function()
  vim.cmd("w")
  local time = os.date("%T")
  vim.api.nvim_command('echohl @class |  echom "saved ' .. time .. '"')
  -- 模仿发送<esc> 进入 normal 模式
  -- 创建一个 Normal 模式的模拟按键序列
  local normal_keys = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  -- 发送模拟按键序列
  vim.api.nvim_feedkeys(normal_keys, "n", true)
end)

-- nohl
map("n", "<leader>h", "<cmd>nohl<cr>", { desc = "clear highlight" })

-- force quit all
map("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "force quit all" })

-- toggle cmp_im
map({ "n", "x", "i", "c" }, "<C-.>", function()
  vim.notify(string.format("虎码%s", require("cmp_im").toggle() and "启动" or "退出"))
end)
map({ "n", "x", "i" }, "<C-,>", function()
  require("cmp_im").toggle_chinese_symbol()
end)

-- better ctrl-d ctrl-u
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down half page and center page" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up half page and center page" })

-- move screen left right
map("n", "<C-b>", "5zh", { desc = "scroll left half page and center page" })
map("n", "<C-f>", "5zl", { desc = "scroll right half page and center page" })
map("n", "<Left>", "5zh", { desc = "scroll left half page and center page" })
map("n", "<Right>", "5zl", { desc = "scroll right half page and center page" })

-- Move Lines
map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- window jump
map("n", "<leader>1", "1<C-w>w", { desc = "Go to window 1" })
map("n", "<leader>2", "2<C-w>w", { desc = "Go to window 2" })
map("n", "<leader>3", "3<C-w>w", { desc = "Go to window 3" })
map("n", "<leader>4", "4<C-w>w", { desc = "Go to window 4" })
map("n", "<leader>5", "5<C-w>w", { desc = "Go to window 5" })
map("n", "<leader>6", "6<C-w>w", { desc = "Go to window 6" })
map("n", "<leader>7", "7<C-w>w", { desc = "Go to window 7" })
map("n", "<leader>8", "8<C-w>w", { desc = "Go to window 8" })
map("n", "<leader>9", "9<C-w>w", { desc = "Go to window 9" })

-- change window origin keymap
map("n", "<C-w>x", "<C-w>s", { desc = "横向分屏当前 buffer" })
map("n", "<C-w>s", "<C-w>x", { desc = "跟下一个窗口进行交换" })
-- obsidian
-- stylua: ignore start
map("n", "<leader>oc", function() require("utils.advanceduri").obsidianOpenCurrentFile() end, { desc = "Obsidian open current file" })
map("n", "<leader>of", function() require("utils.advanceduri").markdownlintCurrentFile()() end, { desc = "Obsidian format current file" })

-- telescope
-- map("n", "<leader>ff", function() require("utils.fancy_telescope").findFile() end, { desc = "Find file" })
map("n", "<leader>ff", function() require("utils.fancy_telescope").findProjectFile() end, { desc = "Find file" })
map({"n","i","x"}, "<C-p>", function() require("utils.fancy_telescope").findProjectFile() end, { desc = "Find file" })
map("n", "<leader>fr", function() require("utils.fancy_telescope").findRecentFile() end, { desc = "Find Recent File" })
map("n", "<leader>fc", function() require("utils.fancy_telescope").findConfigFile() end, { desc = "Find Config File" })
map("n", "<leader>bb", function() require("utils.fancy_telescope").findBuffer() end, { desc = "Switch buffer by telescope" })
map("n", "<leader>sf", function() require("utils.fancy_telescope").grep_string_by_filetype() end, { desc = "Grep string by filetype" })
map("n", "<leader>sg", function() require("utils.fancy_telescope").live_grep_project() end, { desc = "Grep string project" })
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Telescope git_files" })
map("n", "<leader>fh", "<cmd>Telescope highlights<cr>", { desc = "Telescope git_files" })
map("n", "<leader>bf", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
map("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Telescope quickfix" })
map("n", "<leader>fb", function() require("utils.fancy_telescope").super_file_browser() end, { desc = "Telescope file_browse" })

-- flash-zhh
map({"n","x"}, "s",function() require("flash-zhh").jump() end, { desc = "Flash between Chinese(tiger code)" })
map("o", "r",function() require("flash-zhh").jump() end, { desc = "Flash between Chinese(tiger code) Remote" })
-- stylua: ignore end

-- bookmark
map("n", "<leader>dm", "<cmd>delmarks!<cr>", { desc = "Delete Bookmarks" })

-- neo-tree
-- map("n", "<leader>e", "<cmd>Neotree position=current<cr>", { desc = "Neotree current buffer" })

-- translate
map("x", "<leader>tw", "<cmd>Translate<cr>", { desc = "Translate the word under the cursor" })

-- message
map("n", "<leader>snm", "<cmd>message<cr>", { desc = "message" })

-- textobject
map({ "x", "o" }, "il", ":<c-u>normal! g_v^<cr>", { desc = "select current line not include whitespace" })
map({ "x", "o" }, "al", ":<c-u>normal! $v0<cr>", { desc = "select current line include whitespace" })

-- toggleterm
map("n", "<leader>bt", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "btop",
    hidden = true,
    direction = "float",
    float_opts = {
      width = 100,
      height = 24,
      border = "solid",
    },
  })
  lazygit:toggle()
end, { desc = "Toggle btop" })

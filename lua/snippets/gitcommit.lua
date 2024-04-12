local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local function getCommitTime()
  local formattedTime = os.date("backup: %Y-%m-%d %H:%M:%S", timestamp)
  return formattedTime
end

ls.add_snippets("gitcommit", {
  s("/commit", {
    t(getCommitTime()),
  }),
})

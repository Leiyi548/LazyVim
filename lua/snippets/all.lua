local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local function getDateTime(index)
  local formattedTime = os.date()
  if index == 1 then
    formattedTime = os.date("%Y.%m.%d")
  elseif index == 2 then
    formattedTime = os.date("%Y-%m-%d")
  elseif index == 3 then
    formattedTime = os.date("%Y-%m-%d"):gsub("%-", " 年 ", 1):gsub("%-", " 月 ")
    return formattedTime .. " 日"
  end
  return formattedTime
end

ls.add_snippets("all", {
  s("/date3", {
    t(getDateTime(3)),
  }),
})
-- enable luasnip autosnippet
ls.config.setup({ enable_autosnippets = true })

ls.add_snippets("all", {
  s({
    trig = ";a",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("！ "),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";w",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("？"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";s",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("…… "),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";t",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("→"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";f",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("“"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";g",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("”"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";x",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("【"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";c",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("】"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";v",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("《"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";b",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("》"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";e",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("（"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";r",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("）"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";z",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("|"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";u",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("~"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";i",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("——"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";o",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("〖"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";p",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("〗"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";h",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("『"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";j",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("』"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";d",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("、"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";q",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("：“"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";k",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("￥"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";l",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("%"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";n",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("「"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";m",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("」"),
  }),
})

ls.add_snippets("all", {
  s({
    trig = ";y",
    snippetType = "autosnippet",
    condition = function()
      return require("cmp_im").getStatus()
    end,
  }, {
    t("·"),
  }),
})

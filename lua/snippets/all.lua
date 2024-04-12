local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local ms = ls.multi_snippet

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

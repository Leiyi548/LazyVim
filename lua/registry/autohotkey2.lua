local Pkg = require("mason-core.package")
local path = require("mason-core.path")
local std = require("mason-core.managers.std")
local m = require("plugins.mason")

return Pkg.new({
  name = "autohotkey2-lsp",
  desc = [[AutoHotkey v2 Language support]],
  homepage = "https://github.com/thqby/vscode-autohotkey2-lsp",
  languages = { Pkg.Lang["AutoHotkey"] },
  categories = { Pkg.Cat.LSP },
  ---@async
  install = function(ctx)
    local file = "https://github.com/fcying/tools/releases/download/tools/autohotkey2-lsp.zip"
    -- local ver = m.get_version(ctx.package.name)
    std.download_file(file, "lsp.zip")
    std.unzip("lsp.zip", ".")

    ctx.receipt:with_primary_source({
      repo = "fcying/tools",
      file = file,
    })
  end,
})

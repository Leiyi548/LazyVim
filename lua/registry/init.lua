local opts = {
  ["autohotkey2-lsp"] = "registry.autohotkey2",
}

opts = vim.tbl_extend("force", opts, {
  ["clangd"] = "registry.clangd",
  ["lua-language-server"] = "registry.lua_ls",
})

return opts

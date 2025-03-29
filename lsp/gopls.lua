---@type vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = {
    "go.mod",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  single_file_support = true,
}

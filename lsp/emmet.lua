return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
    "htmlangular",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  root_markers = {
    ".git",
  },
}

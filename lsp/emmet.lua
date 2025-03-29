return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "css",
    "html",
    "blade",
    "php",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  root_markers = {
    ".git",
  },
}

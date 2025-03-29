---@type vim.lsp.Config
return {
  cmd = { "rnix-lsp" },
  filetypes = { "nix" },
  root_markers = {
    ".git",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

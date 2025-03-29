---@type vim.lsp.Config
return {
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_markers = { "flake.nix", ".git" },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

---@type vim.lsp.Config
return {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = {
    "flake.nix",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  single_file_support = true,
}

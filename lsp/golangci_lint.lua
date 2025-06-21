---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go" },
  init_options = {
    command = { "golangci-lint", "run", "--out-format", "json", "--show-stats=false", "--issues-exit-code=1" },
  },
  root_markers = {
    "go.mod",
  },
}

return {
  "yetone/avante.nvim",
  version = false,
  enabled = require("nixCatsUtils").enableForCategory("ai"),
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>aa", "<cmd>Avante ask", desc = "Avante Ask" },
  },
  opts = vim.tbl_extend("force", {
    provider = "copilot",
    file_selector = {
      provider = "snacks",
    },
    behaviour = {
      enable_claude_text_editor_tool_mode = true,
    },
    custom_tools = require("custom.avante.tools"),
  }, require("nixCatsUtils").getCatOrDefault("avanteOpts", {}) or {}),
}

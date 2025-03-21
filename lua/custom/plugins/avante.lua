return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  enabled = require("nixCatsUtils").enableForCategory("ai"),
  keys = {},
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = vim.tbl_extend("force", {
    provider = "copilot",
    file_selector = {
      provider = "snacks",
    },
    -- copilot = {
    --   model = "claude-3.7-sonnet",
    --   temperature = 0,
    --   max_tokens = 8192,
    -- },
  }, require("nixCatsUtils").getCatOrDefault("avanteOpts", {}) or {}),
  config = function(_, o)
    require("avante").setup(o)
    require("custom.avante-recipes")
  end,
}

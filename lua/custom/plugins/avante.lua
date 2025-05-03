return {
  "yetone/avante.nvim",
  version = false,
  enabled = require("nixCatsUtils").enableForCategory("ai"),
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
    vendors = {
      qwen = {
        __inherited_from = "openai",
        endpoint = "http://10.27.22.20:11434/v1",
        api_key_name = "",
        model = "qwen3",
      },
    },
    custom_tools = {
      require("custom.avante.behat_tool"),
    },
  }, require("nixCatsUtils").getCatOrDefault("avanteOpts", {}) or {}),
  config = function(_, o)
    require("avante").setup(o)
    -- require("custom.avante.recipes")
  end,
}

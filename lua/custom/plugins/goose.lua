return {
  'azorng/goose.nvim',
  branch = 'main',
  enabled = require("nixCatsUtils").enableForCategory("ai"),
  config = function()
    require('goose').setup({})
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
      },
    }
  },
}

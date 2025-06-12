local dir_path = vim.fn.expand("~/code/plugins/laravel.nvim")
local dir_exists = vim.fn.isdirectory(dir_path) == 1

return {
  "adalessa/laravel.nvim",
  branch = "4.x",
  enabled = require("nixCatsUtils").enableForCategory("laravel"),
  dir = dir_exists and dir_path or nil,
  dependencies = {
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "ravitemer/mcphub.nvim",
  },
  cmd = { "Laravel" },
  keys = {
    {
      "<leader>ll",
      function()
        Laravel.pickers.laravel()
      end,
    },
    {
      "<c-g>",
      function()
        Laravel.commands.run("view:finder")
      end,
    },
    {
      "<leader>la",
      function()
        Laravel.pickers.artisan()
      end,
    },
    {
      "<leader>lt",
      function()
        Laravel.commands.run("actions")
      end,
    },
    {
      "<leader>lr",
      function()
        Laravel.pickers.routes()
      end,
    },
    {
      "<leader>lh",
      function()
        Laravel.run("artisan docs")
      end,
    },
    {
      "<leader>lm",
      function()
        Laravel.pickers.make()
      end,
    },
    {
      "<leader>lc",
      function()
        Laravel.pickers.commands()
      end,
    },
    {
      "<leader>lo",
      function()
        Laravel.pickers.resources()
      end,
    },
    {
      "<leader>lp",
      function()
        Laravel.commands.run("command_center")
      end,
    },
    {
      "gf",
      function()
        local ok, res = pcall(function()
          if Laravel.app("gf").cursorOnResource() then
            return "<cmd>lua Laravel.commands.run('gf')<cr>"
          end
        end)
        if not ok or not res then
          return "gf"
        end
        return res
      end,
      expr = true,
      noremap = true,
    },
  },
  event = { "VeryLazy" },
  opts = {
    lsp_server = "phpactor",
    features = {
      pickers = {
        provider = "snacks",
      },
    },
    user_commands = {
      composer = {
        quality = {
          cmd = { "quality" },
          desc = "Runs the quality script in composer.json",
        },
      },
    },
  },
}

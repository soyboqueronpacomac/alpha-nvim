return {
  "nvim-lualine/lualine.nvim",
  opts = {
    icons_enable = true,
    theme = "auto",
    sections = {
      lualine_y = {
        {
          function()
            return require("laravel").app("status"):get("laravel")
          end,
          icon = { " ", color = { fg = "#F55247" } },
          cond = function()
            return require("laravel").app("status"):has("laravel")
          end,
        },
        {
          function()
            return require("laravel").app("status"):get("php")
          end,
          icon = { " ", color = { fg = "#AEB2D5" } },
          cond = function()
            return require("laravel").app("status"):has("php")
          end,
        },
        {
          function()
            return require("laravel").app("dev_command"):hostname()
          end,
          icon = { " ", color = { fg = "#8FBC8F" } },
          cond = function()
            return require("laravel").app("dev_command"):isRunning()
          end,
        },
        {
          function()
            return #(require("laravel").app("dump_server"):unseenRecords())
          end,
          icon = { "󰱧 ", color = { fg = "#FFCC66" } },
          cond = function()
            return require("laravel").app("dump_server"):isRunning()
          end,
        },
      },
    },
  },
}

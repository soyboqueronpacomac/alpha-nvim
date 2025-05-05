---@diagnostic disable: param-type-mismatch
local y_section = {}

if require("nixCatsUtils").enableForCategory("laravel") then
  y_section = {
    {
      function()
        local ok, status = pcall(require("laravel").app, "status")
        if ok then
          return status:get("laravel")
        end
      end,
      icon = { " ", color = { fg = "#F55247" } },
      cond = function()
        local ok, status = pcall(require("laravel").app, "status")
        if ok then
          return require("laravel").app("status"):has("laravel")
        end
        return false
      end,
    },
    {
      function()
        local ok, status = pcall(require("laravel").app, "status")
        if ok then
          return status:get("php")
        end
        return nil
      end,
      icon = { " ", color = { fg = "#AEB2D5" } },
      cond = function()
        local ok, status = pcall(require("laravel").app, "status")
        if ok then
          return status:has("php")
        end
        return false
      end,
    },
    {
      function()
        local ok, dev_command = pcall(require("laravel").app, "dev_command")
        if ok then
          return dev_command:hostname()
        end
        return nil
      end,
      icon = { " ", color = { fg = "#8FBC8F" } },
      cond = function()
        local ok, dev_command = pcall(require("laravel").app, "dev_command")
        if ok then
          return dev_command:isRunning()
        end
        return false
      end,
    },
    {
      function()
        local ok, dump_server = pcall(require("laravel").app, "dump_server")
        if ok then
          return #(dump_server:unseenRecords())
        end
        return 0
      end,
      icon = { "󰱧 ", color = { fg = "#FFCC66" } },
      cond = function()
        local ok, dump_server = pcall(require("laravel").app, "dump_server")
        if ok then
          return dump_server:isRunning()
        end
        return false
      end,
    },
  }
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    icons_enable = true,
    theme = "auto",
    sections = {
      lualine_y = y_section,
      lualine_c = {
        "filename",
        {
          function()
            local filetype = vim.bo.filetype

            if filetype ~= "lua" then
              return ""
            end

            local node = vim.treesitter.get_node()
            if not node then
              return ""
            end
            while node:type() ~= "function_declaration" do
              node = node:parent()
              if not node then
                return ""
              end
            end

            local function_name_node = node:named_child(0)
            if not function_name_node then
              return ""
            end

            return vim.treesitter.get_node_text(function_name_node, 0)
          end,
          icon = { "󰊕", color = { fg = "#40E0D0" } },
        },
      },
    },
  },
}

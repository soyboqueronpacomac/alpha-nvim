return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")

        vim.fn.sign_define("DapBreakpoint", {
          text = " ",
          texthl = "DiagnosticSignError",
        })
        vim.fn.sign_define("DapBreakpointCondition", {
          text = " ",
          texthl = "DiagnosticSignWarn",
        })
        vim.fn.sign_define("DapStopped", {
          text = " ",
          texthl = "DiagnosticSignInfo",
        })

        if require("nixCatsUtils").enableForCategory("symfony") then
          dap.adapters.php = {
            type = "executable",
            command = "php-debug-adapter",
          }

          dap.configurations.php = {
            {
              type = "php",
              request = "launch",
              name = "Symfony",
              port = 9003,
              pathMappings = {
                ["/app"] = "${workspaceFolder}",
              },
            },
          }
        end

        if require("nixCatsUtils").enableForCategory("laravel") then
          dap.adapters.php = {
            type = "executable",
            command = "php-debug-adapter",
          }
          dap.configurations.php = {
            {
              type = "php",
              request = "launch",
              name = "Laravel",
              port = 9003,
            },
            {
              type = "php",
              request = "launch",
              name = "Laravel Sail",
              port = 9003,
              pathMappings = {
                ["/var/www/html"] = "${workspaceFolder}",
              },
            },
          }
        end
      end,
    },
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>dd",
      function()
        require("dap").continue()
      end,
    },
    {
      "<leader>dp",
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    {
      "<leader>dl",
      function()
        require("dap").step_into()
      end,
    },
    {
      "<leader>dj",
      function()
        require("dap").step_over()
      end,
    },
    {
      "<leader>dk",
      function()
        require("dap").step_out()
      end,
    },
    {
      "<leader>dh",
      function()
        require("dapui").eval()
      end,
    },
    {
      "<leader>dc",
      function()
        require("dap").run_to_cursor()
      end,
    },
    {
      "<leader>dgc",
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition == "" then
            return
          end
          require("dap").set_breakpoint(condition)
        end)
      end,
    },
    {
      "<leader>dg?",
      function()
        vim.ui.input({ prompt = "Log: " }, function(log)
          if log == "" then
            return
          end
          require("dap").set_breakpoint(nil, nil, log)
        end)
      end,
    },
    {
      "<leader>dx",
      function()
        require("dap").terminate()
        require("dapui").close({})
        require("dap").clear_breakpoints()
      end,
    },
  },
  opts = {},
  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
  end,
}

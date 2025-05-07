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
        vim.fn.sign_define("DapLogPoint", {
          text = " ",
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
      desc = "Start| Continue debugging",
    },
    {
      "<leader>dp",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dl",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    {
      "<leader>dj",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
    {
      "<leader>dk",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    {
      "<leader>dh",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate expression",
    },
    {
      "<leader>dc",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to cursor",
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
      desc = "Set conditional breakpoint",
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
      desc = "Set log point",
    },
    {
      "<leader>dx",
      function()
        require("dap").terminate()
        require("dapui").close({})
        require("dap").clear_breakpoints()
      end,
      desc = "Terminate debug session",
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

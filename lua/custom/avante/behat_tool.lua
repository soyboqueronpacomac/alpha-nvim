return {
  name = "run_behat_test", -- Unique name for the tool
  description = "Run behat tests and return results", -- Description shown to AI
  command = "make exec-behat", -- Shell command to execute
  param = { -- Input parameters (optional)
    type = "table",
    fields = {
      {
        name = "target",
        description = "path to the feature test file for specific test add the :<line> of the test",
        type = "string",
        optional = false,
      },
    },
  },
  returns = { -- Expected return values
    {
      name = "result",
      description = "Result of the test",
      type = "string",
    },
    {
      name = "error",
      description = "Error message if the test was not successful",
      type = "string",
      optional = true,
    },
  },
  func = function(params, on_log, on_complete) -- Custom function to execute
    local target = params.target
    return vim.fn.system(string.format("make exec-behat test=%s", target))
  end,
}

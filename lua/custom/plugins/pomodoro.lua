local dir_path = vim.fn.expand("~/code/plugins/pomodoro")
local dir_exists = vim.fn.isdirectory(dir_path) == 1

return {
  "adalessa/pomodoro",
  dir = dir_exists and dir_path or nil,
  event = { "VeryLazy" },
  cmd = { "Pomodoro" },
  opts = {
    running = 25,
    shortPause = 5,
    longPause = 15,
  },
}

local dir_path = vim.fn.expand("~/code/plugins/pomodoro")

return {
  "adalessa/pomodoro",
  dir = dir_path,
  event = { "VeryLazy" },
  cmd = { "Pomodoro" },
  opts = {
    running = 25,
    shortPause = 5,
    longPause = 15,
  },
}

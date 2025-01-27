return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        {"<leader>gg", function() Snacks.lazygit() end}
    },
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = { header = [[
    _    _       _
              / \  | |_ __ | |__   __ _
             / _ \ | | '_ \| '_ \ / _` |
            / ___ \| | |_) | | | | (_| |
           /_/   \_\_| .__/|_| |_|\__,_|
     |_|
            ]] },
        },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}

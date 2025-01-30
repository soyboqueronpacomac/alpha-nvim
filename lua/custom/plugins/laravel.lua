return {
    "adalessa/laravel.nvim",
    enabled = require('nixCatsUtils').enableForCategory("laravel"),
    dependencies = {
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
        { "<leader>ll", "<cmd>Laravel<cr>" },
        { "<c-g>",      "<cmd>Laravel view_finder<cr>" },
        { "<leader>la", "<cmd>Laravel art<cr>" },
        { "<leader>lr", "<cmd>Laravel routes<cr>" },
        { "<leader>lh", "<cmd>Laravel art docs<cr>" },
        { "<leader>lm", "<cmd>Laravel make<cr>" },
        { "<leader>ln", "<cmd>Laravel related<cr>" },
        { "<leader>lc", "<cmd>Laravel commands<cr>" },
        { "<leader>lo", "<cmd>Laravel resources<cr>" },
        { "<leader>lp", "<cmd>Laravel panel<cr>" },
    },
    event = { "VeryLazy" },
    opts = {
        features = {
            pickers = {
                provider = "fzf-lua"
            }
        }
    },
    config = true,
}

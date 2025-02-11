return {
    "tpope/vim-surround",
    -- Lazy
    {
        "vague2k/vague.nvim",
        opts = {},
        lazy = false,
        priority = 100,
        config = function(_, opts)
            require('vague').setup(opts)
            vim.cmd.colorscheme('vague')
        end,
    },
    "direnv/direnv.vim",
    "echasnovski/mini.ai",
}

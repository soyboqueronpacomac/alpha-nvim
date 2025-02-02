local dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
}

if require('nixCatsUtils').enableForCategory("laravel") then
    table.insert(dependencies, "V13Axel/neotest-pest")
end

return {
    "nvim-neotest/neotest",
    dependencies = dependencies,
    keys = {
        { "<leader>tn",  function() require('neotest').run.run() end },
        { "<leader>tl",  function() require('neotest').run.run_last() end },
        { "<leader>tm",  function() require('neotest').summary.run_marked() end },
        { "<leader>tf",  function() require('neotest').run.run(vim.fn.expand('%')) end },
        { "<leader>ts",  function() require('neotest').summary.toggle() end },
        { "<leader>to",  function() require('neotest').output.open({ enter = true }) end },
        { "<leader>ti",  function() require('neotest').output.open({ enter = true, last_run = true }) end },
        { "<leader>tpo", function() require('neotest').output_panel.toggle() end },
        { "<leader>tpl", function() require('neotest').output_panel.clear() end },
    },
    config = function()
        local adapters = {}
        if require('nixCatsUtils').enableForCategory("laravel") then
            table.insert(adapters, require("neotest-pest"))
        end

        require("neotest").setup({
            adapters = adapters,
        })
    end,
}

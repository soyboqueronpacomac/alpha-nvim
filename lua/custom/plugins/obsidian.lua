local vaults = {
    {
        name = "personal",
        path = "~/vaults/personal",
    },
    {
        name = "work",
        path = "~/vaults/work",
    },
}

local events = vim.iter(vaults)
    :map(function(vault)
        return vim.fn.expand(vault.path)
    end)
    :map(function(vault)
        return {
            string.format("BufReadPre %s/*.md", vault),
            string.format("BufNewFile %s/*.md", vault),
        }
    end)
    :flatten()
    :totable()

return {
    "epwalsh/obsidian.nvim",
    enabled = require('nixCatsUtils').enableForCategory("obsidian"),
    version = "*",
    lazy = true,
    event = events,
    cmd = {
        "ObsidianMenu"
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = vaults,
    },
    config = function(_, opts)
        require("obsidian").setup(opts);

        local actions = {
            Search = 'ObsidianSearch',
            Today = 'ObsidianToday',
            Yesterday = 'ObsidianYesterday',
            Tomorrow = 'ObsidianTomorrow',
        }

        vim.api.nvim_create_user_command('ObsidianMenu', function()
            require('fzf-lua').fzf_exec(
                vim.tbl_keys(actions),
                {
                    actions = {
                        ["default"] = function(selected)
                            vim.cmd(actions[selected[1]])
                        end,
                    },
                    prompt = "Obsidian > ",
                }
            )
        end, {})
    end,
}

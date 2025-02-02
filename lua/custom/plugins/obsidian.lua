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

local events = {}
for _, vault in ipairs(vaults) do
    table.insert(events, string.format("BufReadPre %s/*.md", vim.fn.expand(vault.path)))
    table.insert(events, string.format("BufNewFile %s/*.md", vim.fn.expand(vault.path)))
end

return {
    "epwalsh/obsidian.nvim",
    enabled = require('nixCatsUtils').enableForCategory("obsidian"),
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = { unpack(events) },
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

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
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = vaults,
    },
}

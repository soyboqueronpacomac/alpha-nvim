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

local events = vim
  .iter(vaults)
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
  "obsidian-nvim/obsidian.nvim",
  enabled = require("nixCatsUtils").enableForCategory("obsidian"),
  version = "*",
  lazy = true,
  event = events,
  cmd = {
    "ObsidianMenu",
  },
  keys = {
    { "<leader>ob", "<cmd> ObsidianMenu<cr>", desc = "Obsidian Menu" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = vaults,
    pickers = { name = "snacks.pick" },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    local actions = {
      { name = "New", action = "ObsidianNew" },
      { name = "Today", action = "ObsidianToday" },
      { name = "Search", action = "ObsidianSearch" },
      { name = "Yesterday", action = "ObsidianYesterday" },
      { name = "Tomorrow", action = "ObsidianTomorrow" },
    }

    vim.api.nvim_create_user_command("ObsidianMenu", function()
      vim.ui.select(actions, {
        prompt = "Obsidian Action",
        format_item = function(action)
          return action.name
        end,
      }, function(selected)
        if not selected then
          return
        end
        vim.cmd(actions[selected.action])
      end)
    end, {})
  end,
}

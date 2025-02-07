return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  enabled = require('nixCatsUtils').enableForCategory("fuzzy-finder"),
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {},
}

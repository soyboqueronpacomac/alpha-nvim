require('nixCatsUtils').setup {
  non_nix_value = true,
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "";
vim.o.expandtab = true;
vim.o.tabstop = 4;
vim.o.softtabstop = 4;
vim.o.shiftwidth = 4;
vim.o.smartindent = true;
vim.o.errorbells = false;
vim.o.wrap = false;
vim.o.swapfile = false;
vim.o.undofile = true;
vim.o.hlsearch = false;
vim.o.incsearch = true;
vim.o.ignorecase = true;
vim.o.smartcase = true;
vim.o.colorcolumn = "80";
vim.o.termguicolors = true;
vim.o.scrolloff = 4;
vim.o.sidescrolloff = 4;
vim.o.showmode = false;
vim.o.clipboard = "unnamedplus";


-- NOTE: nixCats: You might want to move the lazy-lock.json file
local function getlockfilepath()
  if require('nixCatsUtils').isNixCats and type(require('nixCats').settings.unwrappedCfgPath) == "string" then
    return require('nixCats').settings.unwrappedCfgPath .. "/lazy-lock.json"
  else
    return vim.fn.stdpath("config") .. "/lazy-lock.json"
  end
end

local lazyOptions = {
  lockfile = getlockfilepath(),
}

require('nixCatsUtils.lazyCat').setup(nixCats.pawsible({"allPlugins", "start", "lazy.nvim" }),
{
  require("core.lsp"),
  require("core.treesitter"),
  require("core.file_manager"),
  require("core.fuzzy_finder"),
  require("core.completion"),

  { import = 'custom.plugins' },
}, lazyOptions)

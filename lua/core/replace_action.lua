-- function to replace
vim.cmd([[
    function! AlphaReplace(type)
      let commands = #{
        \ line: "'[V']",
        \ char: "`[v`]",
        \ block: "`[\<C-V>`]",
        \ }[a:type]
      execute 'normal! ' .. commands .. '"_dP'
    endfunction
]])

vim.keymap.set({"n"}, "<leader>r", ":set opfunc=AlphaReplace<CR>g@", {desc = "allow replace action"})

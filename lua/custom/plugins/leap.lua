return {
    "ggandor/leap.nvim",
    config = function ()
       vim.keymap.set('n', 's', '<Plug>(leap-forward-to)')
       vim.keymap.set('n', 'S', '<Plug>(leap-backward-to)')
    end
}

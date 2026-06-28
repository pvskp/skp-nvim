vim.pack.add({
  Gh("lewis6991/gitsigns.nvim")
})

require('gitsigns').setup {
  current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol',     -- 'eol' | 'overlay' | 'right_align'
    delay = 0,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author> (on <abbrev_sha>), <author_time:%R> - <summary>',
}

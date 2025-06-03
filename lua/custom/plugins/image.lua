return {
  '3rd/image.nvim',
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  ft = { 'markdown' },
  opts = {
    processor = 'magick_cli',
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = 'popup',
        floating_windows = true, -- if true, images will be rendered in floating markdown windows
        filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
      },
    },
  },
}

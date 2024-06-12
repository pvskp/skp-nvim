return {
  "X3eRo0/dired.nvim",
  cmd = "Dired",
  opts = {
    path_separator = "/", -- Use '/' as the path separator
    show_hidden = true,   -- Show hidden files
    show_icons = false,   -- Show icons (patched font required)
    show_banner = false,  -- Do not show the banner
    hide_details = false, -- Show file details by default
    sort_order = "name",  -- Sort files by name by default

    -- Define keybindings for various 'dired' actions
    keybinds = {
      dired_enter = "<cr>",
      dired_back = "-",
      dired_up = "_",
      dired_rename = "R",
      dired_create = "d",
      dired_delete = "D",
      dired_delete_range = "D",
      dired_copy = "C",
      dired_copy_range = "C",
      dired_copy_marked = "MC",
      dired_move = "X",
      dired_move_range = "X",
      dired_move_marked = "MX",
      dired_paste = "P",
      dired_mark = "M",
      dired_mark_range = "M",
      dired_delete_marked = "MD",
      dired_toggle_hidden = ".",
      dired_toggle_sort_order = ",",
      dired_toggle_icons = "*",
      dired_toggle_colors = "c",
      dired_toggle_hide_details = "(",
      dired_quit = "q",
    },

    -- Define colors for different file types and attributes
    colors = {
      DiredDimText = { link = {}, bg = "NONE", fg = "505050", gui = "NONE" },
      DiredDirectoryName = { link = {}, bg = "NONE", fg = "9370DB", gui = "NONE" },
      -- ... (define more colors as needed)
      DiredMoveFile = { link = {}, bg = "NONE", fg = "ff3399", gui = "bold" },
    },
  },
}

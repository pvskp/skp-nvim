return {
  "ziontee113/color-picker.nvim",
  lazy = false,
  opts = { -- for changing icons & mappings
    -- ["icons"] = { "ﱢ", "" },
    -- ["icons"] = { "ﮊ", "" },
    -- ["icons"] = { "", "ﰕ" },
    -- ["icons"] = { "", "" },
    -- ["icons"] = { "", "" },
    ["icons"] = { "ﱢ", "" },
    ["border"] = Borders.simple, -- none | single | double | rounded | solid | shadow
    ["keymap"] = {               -- mapping example:
      ["U"] = "<Plug>ColorPickerSlider5Decrease",
      ["O"] = "<Plug>ColorPickerSlider5Increase",
    },
    ["background_highlight_group"] = "Normal",  -- default
    ["border_highlight_group"] = "FloatBorder", -- default
    ["text_highlight_group"] = "Normal",        --default
  },
  config = function(_, opts)
    require("color-picker").setup(opts)
    vim.keymap.set("n", "<leader>pc", "<cmd>PickColor<cr>", {
      desc = "[P]ick [C]olor",
    })
    vim.keymap.set("i", "<C-b>", "<cmd>PickColorInsert<cr>", {
      desc = "Pick Color",
    })
    vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
  end,
}

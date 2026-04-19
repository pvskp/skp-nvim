vim.pack.add({
  Gh("folke/sidekick.nvim"),
})

require("sidekick").setup({
  cli = {
    picker = "fzf-lua",
    mux = {
      backend = "tmux",
      enabled = true,
      create = "window", ---@type "terminal"|"window"|"split"
    },
  },
})

Map({ "n", "t", "x" }, "<leader>aa", function()
  require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

Map(
  "n",
  "<leader>as",
  function()
    require("sidekick.cli").select()
  end,
  -- Or to select only installed tools:
  -- require("sidekick.cli").select({ filter = { installed = true } })
  { desc = "Select CLI" }
)

Map({ "x", "n" }, "<leader>at", function()
  require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

Map("n", "<leader>af", function()
  require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

Map({ "x" }, "<leader>av", function()
  require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

Map({ "n", "x" }, "<leader>ap", function()
  require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

Map({ "x", "v", "n", "t" }, "<leader><Tab>", function()
  require("sidekick.cli").focus()
end, { desc = "Switch Focus" })

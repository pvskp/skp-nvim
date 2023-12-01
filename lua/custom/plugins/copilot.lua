return {
  "zbirenbaum/copilot-cmp",
  dependencies = {"zbirenbaum/copilot.lua"},
  config = function ()
    local copilot_lua = require("copilot")
    local copilot_cmp = require("copilot_cmp")

    copilot_lua.setup()
    copilot_cmp.setup()
  end
}

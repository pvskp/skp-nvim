return {
    "zbirenbaum/copilot-cmp",
    dependencies = {"zbirenbaum/copilot.lua"},
    cmd = {"Copilot"}, -- Disables copilot on start
    config = function ()
        local copilot_lua = require("copilot")
        local copilot_cmp = require("copilot_cmp")

        copilot_lua.setup({
            filetypes = {
                yaml = true,
                markdown = true,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },

        })
        copilot_cmp.setup()
    end
}

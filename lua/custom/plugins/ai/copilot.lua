return {
  'zbirenbaum/copilot.lua',
  name = 'copilot',
  cmd = 'Copilot',
  event = 'InsertEnter',
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
  },
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
      gitcommit = true,
      gitrebase = true,
      hgcommit = true,
      svn = true,
      cvs = true,
      ['.'] = true,
    },
  },
}

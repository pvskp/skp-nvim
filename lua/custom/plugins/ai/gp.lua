return {
  'robitx/gp.nvim',
  event = 'BufEnter',
  -- dir = "~/Documents/repos/gp.nvim/",
  keys = {
    {
      '\\',
      '<cmd>GpChatToggle<CR>',
      { desc = 'Toggle ChatGPT chat window', silent = true },
      mode = 'n',
    },
  },
  opts = {
    openai_api_key = os.getenv 'OPENAI_API_KEY',
    openai_api_endpoint = 'https://api.openai.com/v1/chat/completions',
    cmd_prefix = 'Gp',
    curl_params = {},
    state_dir = vim.fn.stdpath('data'):gsub('/$', '') .. '/gp/persisted',
    agents = {
      {
        name = 'ChatGPT4',
        chat = true,
        command = false,
        model = { model = 'gpt-4-1106-preview', temperature = 1.1, top_p = 1 },
        system_prompt = 'You are a general AI assistant.\n\n'
          .. 'The user provided the additional info about how they would like you to respond:\n\n'
          .. "- If you're unsure don't guess and say you don't know instead.\n"
          .. '- Ask question if you need clarification to provide better answer.\n'
          .. '- Think deeply and carefully from first principles step by step.\n'
          .. '- Zoom out first to see the big picture and then zoom in to details.\n'
          .. '- Use Socratic method to improve your thinking and coding skills.\n'
          .. "- Don't elide any code from your output if the answer requires coding.\n"
          .. "- Take a deep breath; You've got this!\n",
      },
      {
        name = 'ChatGPT3-5',
        chat = true,
        command = false,
        model = { model = 'gpt-3.5-turbo-1106', temperature = 1.1, top_p = 1 },
        system_prompt = 'You are a general AI assistant.\n\n'
          .. 'The user provided the additional info about how they would like you to respond:\n\n'
          .. "- If you're unsure don't guess and say you don't know instead.\n"
          .. '- Ask question if you need clarification to provide better answer.\n'
          .. '- Think deeply and carefully from first principles step by step.\n'
          .. '- Zoom out first to see the big picture and then zoom in to details.\n'
          .. '- Use Socratic method to improve your thinking and coding skills.\n'
          .. "- Don't elide any code from your output if the answer requires coding.\n"
          .. "- Take a deep breath; You've got this!\n",
      },
      {
        name = 'CodeGPT4',
        chat = false,
        command = true,
        model = { model = 'gpt-4-1106-preview', temperature = 0.8, top_p = 1 },
        system_prompt = 'You are an AI working as a code editor.\n\n'
          .. 'Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n'
          .. 'START AND END YOUR ANSWER WITH:\n\n```',
      },
      {
        name = 'CodeGPT3-5',
        chat = false,
        command = true,
        model = { model = 'gpt-3.5-turbo-1106', temperature = 0.8, top_p = 1 },
        system_prompt = 'You are an AI working as a code editor.\n\n'
          .. 'Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n'
          .. 'START AND END YOUR ANSWER WITH:\n\n```',
      },
    },
    chat_dir = vim.fn.stdpath('data'):gsub('/$', '') .. '/gp/chats',
    chat_user_prefix = '🗨:',
    chat_assistant_prefix = { '🤖:', '[{{agent}}]' },
    chat_topic_gen_prompt = 'Summarize the topic of our conversation above'
      .. ' in two or three words. Respond only with those words.',
    chat_topic_gen_model = 'gpt-3.5-turbo-16k',
    chat_confirm_delete = true,
    chat_conceal_model_params = true,
    chat_shortcut_respond = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g><C-g>' },
    chat_shortcut_delete = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>d' },
    chat_shortcut_stop = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>s' },
    chat_shortcut_new = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>c' },
    chat_finder_pattern = 'topic ',
    chat_free_cursor = false,
    toggle_target = 'vsplit',
    style_chat_finder_border = 'single',
    style_chat_finder_margin_bottom = 8,
    style_chat_finder_margin_left = 1,
    style_chat_finder_margin_right = 2,
    style_chat_finder_margin_top = 2,
    style_chat_finder_preview_ratio = 0.5,
    style_popup_border = 'single',
    style_popup_margin_bottom = 8,
    style_popup_margin_left = 1,
    style_popup_margin_right = 2,
    style_popup_margin_top = 2,
    style_popup_max_width = 160,
    command_prompt_prefix_template = '🤖 {{agent}} ~ ',
    command_auto_select_response = true,
    template_selection = 'I have the following from {{filename}}:'
      .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}',
    template_rewrite = 'I have the following from {{filename}}:'
      .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
      .. '\n\nRespond exclusively with the snippet that should replace the selection above.',
    template_append = 'I have the following from {{filename}}:'
      .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
      .. '\n\nRespond exclusively with the snippet that should be appended after the selection above.',
    template_prepend = 'I have the following from {{filename}}:'
      .. '\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}'
      .. '\n\nRespond exclusively with the snippet that should be prepended before the selection above.',
    template_command = '{{command}}',
  },
  config = function(_, opts)
    require('gp').setup(opts)
  end,
}

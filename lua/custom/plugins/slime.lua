return {
  "jpalardy/vim-slime",
  ft = "quarto",
  init = function()
    vim.g.slime_target = 'neovim'
    vim.g.slime_python_ipython = 1

    vim.cmd [[
function! _EscapeText_python(text)
  if slime#config#resolve("python_ipython") && len(split(a:text,"\n")) > 1
    return ["%cpaste -q\n", slime#config#resolve("dispatch_ipython_pause"), a:text, "--\n"]
  else
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
    let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
    let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
    let except_pat = '\(elif\|else\|except\|finally\)\@!'
    let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
    return substitute(dedented_lines, add_eol_pat, "\n", "g")
  end
endfunction
    ]]
  end,
  config = function()
    vim.keymap.set({ 'n', 'i' }, '<C-space>', function()
      vim.cmd('call slime#send_cell()')
    end, { desc = "Send cell to REPL" })
  end
}

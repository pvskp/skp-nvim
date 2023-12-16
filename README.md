# nvim-dotfiles

This repository contains my new [Neovim](https://neovim.io/) - from scratch - configuration. It has no purpose of distribution, but feel free to copy-paste anything you would like 💪

![image](https://github.com/pvskp/nvim-dotfiles/assets/77075070/5d1bc2bc-015f-45ae-a4c3-4ed88dda7682)
![image](https://github.com/pvskp/nvim-dotfiles/assets/77075070/f5719978-36bf-4d30-b721-8a24a98722f4)

## Key Remappings

Below are some of the key remappings included in my `remap.lua` file for Neovim. These customizations enhance productivity and ease of use.

### General Navigation and Commands

- **Leader Key**: Spacebar
- **Open netrw (native Neovim file explorer)**: `<C-e>` (Normal mode)
- **Clear highlights**: `<leader>h` (Normal mode)
- **Save file**: `<C-s>` (Normal mode)
- **Open terminal**: `<M-f>` (Normal mode)
- **Exit terminal mode**: `<M-q>` (Terminal mode)
- **Force quit current window**: `Q` (Normal mode)

### Window Splitting and Navigation

- **Split window horizontally**: `<M-s>` (Normal mode)
- **Split window vertically**: `<M-d>` (Normal mode)
- **Navigate split windows**: `<M-j>`, `<M-k>`, `<M-l>`, `<M-h>` (Normal mode)

### Window Resizing

- **Interactive resize mode**: `<M-a>r` (Normal mode)
  - Inside interactive mode: `j`, `k`, `h`, `l` to resize
  - Exit interactive resize: `<C-c>` or `q`
- **Maximize current window**: `<M-z>` (Normal mode)
- **Equalize window sizes**: `<M-=>` (Normal mode)

### Text Editing

- **Move text up/down in visual mode**: `J` (Move down), `K` (Move up) (Visual mode)
- **Indent/unindent text**: `>` (Indent), `<` (Unindent) (Visual mode)

### LSP Shortcuts

- **Open diagnostic float**: `gl` (Normal mode)
- **Navigate diagnostics**: `[d` (Previous), `]d` (Next) (Normal mode)
- **Diagnostic list**: `<space>q` (Normal mode)

### Tab Management

- **Open new tab with terminal**: `<M-a>c` (Normal mode)
- **Switch between tabs**: `<M-1>` to `<M-9>` (Normal mode)

## Installation
In order to install this configuration, you will need to follow the steps below:

1. Backup your current Neovim configuration (if you have one)
```bash
$ mv ~/.config/nvim ~/.config/nvim.bak
```
2. Clone this repository into your Neovim configuration directory
```bash
$ git clone https://github.com/pvskp/nvim-dotfiles.git ~/.config/nvim
```
3. Start Neovim
```bash
$ nvim
```

[Lazy](https://github.com/folke/lazy.nvim) should automatically install all plugins and dependencies. If it doesn't, you can install them manually by running `:Lazy` inside Neovim.

# Troubleshooting
As long this is for personal use, I will not provide any support, but maybe helping to debug some problem. However, feel free to open an issue if you want to suggest something or report a bug.

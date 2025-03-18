# Neovim Configuration with Lua and LazyVim

This is my custom Neovim setup using Lua, managed with [LazyVim](https://github.com/folke/lazy.nvim) as the package manager. It includes a variety of plugins to enhance productivity, development, and workflow automation.

## Included Plugins

| Plugin                  | Functionality                                      |
|-------------------------|--------------------------------------------------|
| [alpha.lua](https://github.com/goolord/alpha-nvim) | Startup screen for Neovim. |
| [autosplit.lua](https://github.com/yochem/autosplit.nvim) | Auto-resizes splits dynamically. |
| [cmp.lua](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine. |
| [flash.lua](https://github.com/folke/flash.nvim) | Enhanced navigation. |
| [harpoon.lua](https://github.com/ThePrimeagen/harpoon) | Quick file navigation. |
| [lsp.lua](https://github.com/neovim/nvim-lspconfig) | LSP configurations. |
| [luasnip.lua](https://github.com/L3MON4D3/LuaSnip) | Snippet engine. |
| [mason.lua](https://github.com/williamboman/mason.nvim) | LSP/DAP installer. |
| [notify.lua](https://github.com/rcarriga/nvim-notify) | Notification manager. |
| [null-ls.lua](https://github.com/jose-elias-alvarez/null-ls.nvim) | Extra LSP sources. |
| [obsidian.lua](https://github.com/epwalsh/obsidian.nvim) | Obsidian note integration. |
| [oil.lua](https://github.com/stevearc/oil.nvim) | File management. |
| [pomo.lua](https://github.com/epwalsh/pomo.nvim) | Pomodoro timer. |
| [spectre.lua](https://github.com/nvim-pack/nvim-spectre) | Search and replace. |
| [telescope.lua](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder. |
| [tmuxNavigator.lua](https://github.com/christoomey/vim-tmux-navigator) | Seamless Tmux navigation. |
| [todo-comments.lua](https://github.com/folke/todo-comments.nvim) | Highlight and manage TODOs. |
| [treesitter.lua](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting. |
| [trouble.lua](https://github.com/folke/trouble.nvim) | Diagnostics list. |
| [ufo.lua](https://github.com/kevinhwang91/nvim-ufo) | Code folding. |
| [whichKey.lua](https://github.com/folke/which-key.nvim) | Keybinding helper. |

## Installation

To use this configuration, follow these steps:

### Step 1: Remove the existing Neovim configuration (if necessary)
```bash
rm -rf ~/.config/nvim
```

### Step 2: Create a new Neovim configuration directory
```bash
mkdir -p ~/.config/nvim
```

### Step 3: Navigate to the configuration folder
```bash
cd ~/.config/nvim
```

### Step 4: Clone the custom Neovim configuration
```bash
git clone https://github.com/your-repo/neovim-config.git .

```
With this setup, you now have a powerful and modular Neovim configuration ready to use. Enjoy coding with an optimized workflow!

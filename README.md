# Custom Neovim Configuration (Based on Kickstart.nvim)

A personalized Neovim configuration focused on speed, usability, and a seamless transition from JetBrains IDEs (via `.ideavimrc` compatibility). It uses `lazy.nvim` as the plugin manager.

## Key Features

- **JetBrains/IdeaVim Parity**: Custom keymaps (`<leader>wh`, `<leader>wv`, `<leader>ya`, `<leader>bo`, etc.) mapped exactly as in IntelliJ.
- **Snacks.nvim Integration**: Replaces multiple legacy plugins with a fast, modern, all-in-one UI/UX plugin for picker, explorer, and notifications.
- **LSP & Autocompletion**: Out-of-the-box support for modern language servers with `nvim-cmp` and `mason.nvim`.

## Installed Plugins

This setup relies on the following plugins, organized into logical components:

### ⚙️ Core & Package Management
- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: The modern, fast plugin manager for Neovim.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides syntax highlighting, code parsing, and advanced text objects.

### 🎨 UI & Theming
- **[Snacks.nvim](https://github.com/folke/snacks.nvim)**: A collection of small QoL plugins. Used here for Pickers, Explorer, Notifications, Git operations, and Zen Mode.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and easy-to-configure statusline.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: Snazzy buffer/tabline with file icons.
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)**: A fast and fully customizable greeter/dashboard for Neovim.
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**: Adds indentation guides to all lines.
- **[noice.nvim](https://github.com/folke/noice.nvim)**: Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

### 🛠️ Editor & Workflow
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Highly extendable fuzzy finder over lists (files, symbols, grep, etc.).
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: Manage and browse the file system in a sidebar.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: The completion engine. Combines snippets, LSP, and buffer text into one menu.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart and powerful comment plugin (handles `gcc`, `gc`, etc.).
- **[nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)**: Clipboard manager that records your yank history.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Super fast git decorations (hunks, blame) implemented purely in Lua.
- **[screenkey.nvim](https://github.com/NStefan002/screenkey.nvim)**: Screencast your keypresses (great for sharing/recording).
- **[nvim-osc52](https://github.com/ojroques/nvim-osc52)**: Plugin to copy text to the system clipboard using the ANSI OSC52 sequence (useful over SSH).

### 🧠 LSP & Formatting
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, linters, and formatters.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Quickstart configs for Neovim LSP.
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)**: Use Neovim as a language server to inject LSP diagnostics, code actions, and formatting.
- **[blink.cmp](https://github.com/Saghen/blink.cmp)**: A modern, performant autocompletion engine (replaces nvim-cmp).

## Usage

1. Open Neovim. `lazy.nvim` will automatically download and install all configured plugins.
2. Run `:Mason` to see and install language servers.
3. Check the `lua/core/keymaps.lua` for specific IntelliJ-like bindings.

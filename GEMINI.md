# Project Context: Neovim Configuration

This repository contains a modular Neovim configuration written in Lua, utilizing `lazy.nvim` for plugin management.

## Core Mandates

- **Modularity:** Keep configurations separated by plugin or concern.
- **Lua Patterns:** Follow idiomatic Lua and Neovim API practices.
- **Plugin Management:** Use `lazy.nvim` conventions.
- **LUA Libraries:** First priority is to use builtin Neovim libraries

## Architecture

- `lua/config/`: Configuration for plugins and and neovim.
- `lua/plugins/`: Individual plugin specifications and configurations.
- `lua/utils/`: Shared utility functions.
- `nvim.example.yml`: This is configuration file which is processed by `lua/utils/config.lua`. Suggest changes to it when adding new plugin.
- `install/`: Installation scripts, for different Linux's distributive. Scripts install neovim and its dependencies.

## Development Workflow

- When adding a new plugin, create a corresponding file in `lua/plugins/`.
- For LSP changes, modify the relevant server config in `lua/config/lsp/`.

## Plugins

### Plugins management

Main plugin manager is [lazy.nvim](https://github.com/folke/lazy.nvim), its configuration located in `lua/config/lazy.nvim`.

### Plugins list

This is list of list that are used in current configuration. Refer to the links below for comprehensive documentation and configuration details.

- [alpha-nvim](https://github.com/goolord/alpha-nvim): A fast and fully programmable dashboard for Neovim.
- [blink.cmp](https://github.com/saghen/blink.cmp): High-performance completion engine.
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): To add bufferline and manage tabs.
- [catppuccin](https://github.com/catppuccin/nvim): For main them, main them for current configuration is `catppuccin-frappe`.
- [conform.nvim](https://github.com/stevearc/conform.nvim): Lightweight yet powerful formatter plugin.
- [dressing.nvim](https://github.com/stevearc/dressing.nvim): UI improvements for neovim.
- [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim): IDE-like breadcrumbs for winbar.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers.
- [gopher](https://github.com/olexsmir/gopher.nvim): Minimalistic Go development plugin.
- [hover.nvim](https://github.com/lewis6991/hover.nvim): Hover plugin for Neovim.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Indent guides for Neovim.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol client for Neovim.
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui): A UI for nvim-dap.
- [nvim-dap-go](https://github.com/leoluz/nvim-dap-go): Extension for nvim-dap providing configurations for go.
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python): Extension for nvim-dap providing configurations for python.
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text): Virtual text support for nvim-dap.
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim): Wrapper for `masson.nvim` that provides automatic intgration and UI for different LSP servers.
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim): Install and upgrade third-party tools (LSP, DAP, linters, formatters) managed by Mason.
- [masson.nvim](https://github.com/mason-org/mason.nvim): Provides integration with `nvim-lspconfig`.
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim): For markdown preview in browser.
- [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim): High-performance AI code completion plugin.
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): For file browsing, object outliner and basic git operations.
- [neotest](https://github.com/nvim-neotest/neotest): A framework for interacting with tests within Neovim.
- [neotest-python](https://github.com/nvim-neotest/neotest-python): A neotest adapter for python.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Provides integration with variuse LSP servers.
- [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim): Status line for neovim.
- [nvim-lint](https://github.com/mfussenegger/nvim-lint): An asynchronous linter plugin for Neovim.
- [nvim-notify](https://github.com/rcarriga/nvim-notify): UX friendly wrapper for neovim notification message.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): For automatic closing of brackets and quotes.
- [nvim-treesitter](nvim-treesitter/nvim-treesitter): Plugin to enable syntax syntax highlighting.
- [telescope](https://github.com/nvim-telescope/telescope.nvim): Plugin for fuzzy search.
- [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim): Plugin for virtual environment management.
- [which-key.nvim](https://github.com/folke/which-key.nvim): Used for keys hinting and mapping.

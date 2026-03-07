# Custom Neovim Configuration

A modular, high-performance Neovim configuration written in Lua, designed for productivity and ease of use. It features advanced LSP integration, AI-powered code completion, comprehensive debugging tools, and a polished UI.

## 🚀 Key Features

- **Modular Architecture**: Clean separation of concerns with dedicated files for plugins, keymaps, and options.
- **Advanced Completion**: Powered by `blink.cmp` with optional AI-driven completions via `minuet-ai.nvim` (Gemini integration).
- **LSP & Formatting**: Robust LSP support via `nvim-lspconfig` and `mason.nvim`. Formatting is handled by `conform.nvim`.
- **Debugging (DAP)**: Integrated debugger support for Go and other languages via `nvim-dap`, `nvim-dap-ui`, and `nvim-dap-go`.
- **Modern UI**: Enhanced interface with `catppuccin` theme, `lualine`, `bufferline`, `neo-tree`, and `alpha-nvim` dashboard.
- **Go Support**: Specialized tools for Go development, including `gopher.nvim`, `dap-go`, and custom formatting.
- **Dynamic Configuration**: Support for project-specific and user-level configuration via `nvim.yml` files.

## 📁 Project Structure

```text
.
├── init.lua              # Entry point
├── nvim.example.yml      # Configuration template
├── install/              # Installation scripts for various distros
└── lua/
    ├── config/           # General Neovim settings and keymaps
    │   ├── keys/         # Plugin-specific keybindings
    │   └── lsp/          # LSP server configurations
    ├── plugins/          # Individual plugin specifications (lazy.nvim)
    └── utils/            # Shared utility functions
```

## 🛠️ Installation

### 1. Prerequisites

Ensure you have the following installed on your system:
- Neovim (latest stable version)
- Git
- `luarocks` (for Lua dependencies)
- Node.js & npm (for certain LSP servers)
- Go (if you plan to use Go-related features)
- Cargo (required for building `blink.cmp`)

### 2. Automatic Installation

The repository includes installation scripts for various Linux distributions:

```bash
# Navigate to the install directory
cd install/

# Run the installation script for your distro (archlinux, fedora, ubuntu, or cloudtop)
./install.sh <distro_name>
```

The script will install:
- Distro-specific dependencies
- Nerd Fonts (MesloLGS NF)
- `neovim` npm package
- `delve` (Go debugger)

### 3. Environment Setup

After installation, ensure the following paths are added to your `PATH` variable:
- `~/.local/bin`
- `~/go/bin`

## ⚙️ Configuration

This setup uses a YAML-based configuration system. To customize your environment:

1. Copy `nvim.example.yml` to `~/.config/nvim/nvim.yml` (or your project root).
2. Modify the settings as needed.

### AI Integration (Optional)

To enable Minuet AI (Gemini) completions, update your `nvim.yml`:

```yaml
gemini:
  enabled: true
  model: "gemini-1.5-flash"
  api_key: "YOUR_API_KEY"
```

## ⌨️ Keybindings

The leader key is set to `<Space>`.

- `<leader>w`: Write buffer content
- `<leader>c`: Close current buffer
- `<leader>e`: Toggle file explorer (Neo-tree)
- `<leader>ff`: Find files (Telescope)
- `<leader>lg`: LazyGit (if configured)
- `<leader>t`: Run tests (Neotest)

Plugin-specific keybindings can be found in `lua/config/keys/`.

## 📦 Core Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim): Plugin manager.
- [blink.cmp](https://github.com/saghen/blink.cmp): High-performance completion engine.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): LSP configuration.
- [conform.nvim](https://github.com/stevearc/conform.nvim): Code formatter.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder.
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): File explorer.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap): Debugger.
- [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim): AI code completion.
- [catppuccin](https://github.com/catppuccin/nvim): Theme.

For a full list of plugins, refer to `GEMINI.md`.

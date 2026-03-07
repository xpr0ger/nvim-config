---
name: neovim-plugin-install
description: Automates the installation and initial configuration of a new Neovim plugin using lazy.nvim. Use when the user wants to add a specific plugin to their configuration by providing its name, repository path, and optional URL.
---

# Neovim Plugin Install

This skill handles the creation of a new plugin specification file for `lazy.nvim` in this project's modular configuration. Including itergarion with other existing plugins, handles creation of key maps and autogroup if needed. 

## Arguments

- `[name]`: The local name for the plugin file (e.g., `telescope`). This will be used to create `lua/plugins/[name].lua`.
- `[plugin]`: The GitHub repository identifier (e.g., `nvim-telescope/telescope.nvim`).
- `[url]`: The full URL of the plugin repository.

## Procedures

1. **Verify Workspace Structure**: Ensure you are in the Neovim configuration root.
2. **Collecting documentation and context**: Use provided url and other means have to collect recent documentation and examples for given plugin.
2. **Create Plugin File**: Create a new file at `lua/plugins/[name].lua`.
3. **Write Specification**: Use the following template for the file content:
   ```lua
   return {
       "[plugin]",
       opts = {},
   }
   ```
4. **Configure plugin**: Configure plugin with recommended configuration, create key maps and autocmds if needed.
5. **Integration with existing plugins**: Check all exisintg plugins in `lua/plugins/` directory and add proper intergarion if required.
6. **Validation**:
   - Run `nvim --headless +qa` to check for syntax errors in the new configuration.
   - If the user is in an interactive session, remind them to run `:Lazy sync` to install the new plugin.
7. **Update GEMINI.md**: Update `GEMINI.md` file accordingly, update plugin section and keep its alphabetical order. Check if anything else need to be updated or fixed in the file. 
5. **Finalize**: Confirm the file was created and providing a brief overview of where to add further configuration.

## Resources
- `config/keys/{{plugin_name}}.lua`: A file which contains plugin's key maps if needed.
- `config/autocmd/{{plugin_name}}.lua`: A file which contains plugin's autogroups if needed.
- `config/plugins/{{plugin_name}}.lua`: Plugin file.
- `lazy-lock.json`: Current plugin state.
- `utils/`: Contains different helper for plugins and it's functionality.

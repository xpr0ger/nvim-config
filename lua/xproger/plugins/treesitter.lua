return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "bash", "go", "gomod", "gowork", "gosum", "json", "yaml", "ssh_config", "regex", "toml" },
        })
    end
 }

-- Bootstraping lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Instaling lazy.vim to " .. lazypath)
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- End of bootstraping

-- Custom remapping
require("xproger.remap")
require("xproger.settings")

-- Plugins
local plugins = {
    require("xproger.plugins.telescope"),
    require("xproger.plugins.whichkey"),
    require("xproger.plugins.catppuccin"),
    require("xproger.plugins.treesitter"),
    require("xproger.plugins.neotree"),
    require("xproger.plugins.lualine"),
    require("xproger.plugins.barbar"),
    require("xproger.plugins.mason-lspconfig"),
    require("xproger.plugins.dressing"),
    require("xproger.plugins.nvim-notify"),
    require("xproger.plugins.nvim-cmp"),
    require("xproger.plugins.toggleterm"),
    require("xproger.plugins.mason-null-ls"),
    require("xproger.plugins.null-ls"),
    require("xproger.plugins.mason"),
    require("xproger.plugins.nvim-lspconfig"),
    require("xproger.plugins.autopairs"),
    require("xproger.plugins.navic"),
}
-- End of plugins

require("lazy").setup(plugins)

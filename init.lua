-- Bootstraping lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.vim to " .. lazypath)
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

-- Plugins
local utils_plugins = require("xproger.utils.plugins")
local plugins = utils_plugins.loadPlugins("lua/xproger/plugins/*.lua")
require("lazy").setup(plugins)

-- Applying additional settings related to nVim
require("xproger.settings")

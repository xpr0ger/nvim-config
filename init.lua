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
require("xproger.settings")

-- Plugins
plugins = require("xproger.plugins")
local utils_plugins = require("xproger.utils.plugins")
local plugins_v2 = utils_plugins.loadPlugins("lua/xproger/plugins/*.lua")
require("lazy").setup(plugins_v2)

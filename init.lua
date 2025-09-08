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
require("core.config.vim.remap")

-- Plugins
local plugins = require("core.plugins").plugins
require("lazy").setup(plugins, { git = { throttle = { enabled = true, rate = 1, duration = 5 * 1000 } } })

-- Applying additional settings related to nVim
require("core.config.vim.settings")

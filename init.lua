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

-- Plugins
local plugins = {
  require("xproger.plugins.telescope"),
  require("xproger.plugins.whichkey"),
  require("xproger.plugins.catppuccin"),
  require("xproger.plugins.treesitter"),
}
-- End of plugins

require("lazy").setup(plugins)
require("xproger.plugins.after.catppuccin")
require("xproger.plugins.after.telescope")

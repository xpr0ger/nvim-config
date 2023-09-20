return {
    'rcarriga/nvim-notify',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
    },
    version = '^3.0.0',
    init = function()
    local notify = require('notify')
    notify.setup()
    vim.notify = notify
    
   require("telescope").load_extension("notify")
    end,
}


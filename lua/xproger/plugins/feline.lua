return {
    'feline-nvim/feline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
    },
    version = '^1.0.0',
    init = function()
        require("feline").setup()
--        require("feline").winbar().setup()
    end,
}


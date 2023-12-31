return {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function(_, opts)
        require("yaml-companion").setup(opts)
        require("telescope").load_extension("yaml_schema")
    end,
}

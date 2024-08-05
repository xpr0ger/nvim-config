return {
    "leoluz/nvim-dap-go",
    opts = {
        dap_configurations = {
            {
                type = "go",
                name = "Attache mode",
                mode = "remote",
                request = "attache",
            },
        },
        delve = {
            build_flags = require("core.config.golang").build_tags,
        },
    },
    config = function(_, opts)
        local dap_go = require("dap-go")
        dap_go.setup(opts)

        local wk = require("which-key")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserDapGoConfig", {}),
            callback = function(ev)
                if vim.bo[ev.buf].filetype ~= "go" then
                    return nil
                end
                wk.add({
                    { "<leader>d",  group = "Debug" },
                    { "<leader>dg", group = "GoLang" },
                    {
                        "<leader>dgc",
                        function()
                            require("dapui").open()
                            dap_go.debug_test()
                        end,
                        desc = "Debug closest test",
                        noremap = true,
                    },
                    {
                        "<leader>dgl",
                        function()
                            require("dapui").open()
                            dap_go.debug_last_test()
                        end,
                        desc = "Debug latest test",
                        noremap = true,
                    },
                })
            end,
        })
    end,
}

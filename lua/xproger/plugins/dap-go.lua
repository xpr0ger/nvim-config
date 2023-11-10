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
            build_flags = "-tags=tests integration test mock lasting",
        },
    },
    config = function(LazyPlugins, opts)
        local dap_go = require("dap-go")
        dap_go.setup(opts)

        local wk = require("which-key")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserDapGoConfig", {}),
            callback = function(ev)
                if vim.bo[ev.buf].filetype ~= "go" then
                    return nil
                end

                wk.register({
                    d = {
                        name = "Debug",
                        g = {
                            name = "golang",
                            c = {
                                function()
                                    require("dapui").open()
                                    dap_go.debug_test()
                                end,
                                "Debug closest test",
                                noremap = false,
                                buffer = ev.buf,
                            },
                            l = {
                                function()
                                    require("dapui").open()
                                    dap_go.debug_last_test()
                                end,
                                "Debug last test",
                                noremap = false,
                                buffer = ev.buf,
                            },
                        },
                    },
                }, { prefix = "<leader>" })
            end,
        })
    end,
}

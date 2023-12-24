local neotest_bindings = function(neotest, buffer)
    return {
        T = {
            name = "Tests",
            c = { neotest.run.run, "Run current test", noremap = false, buffer = buffer },
            d = {
                function()
                    neotest.run.run(vim.fn.expand("%"))
                end,
                "Run test in directory",
                noremap = false,
                buffer = buffer,
            },
            p = {
                function()
                    neotest.run.run(vim.fn.getcwd())
                end,
                "Run project tests",
                noremap = false,
                buffer = buffer,
            },
            s = {
                function()
                    neotest.run.stop()
                end,
                "Stop tests",
                noremap = false,
                buffer = buffer,
            },
        },
    }
end
local opts_bindings = { prefix = "<leader>" }
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
    },

    config = function()
        -- TODO: Move to dedicated property of the plugin configuration
        local wk = require("which-key")
        local opts = {
            adapters = {
                require("neotest-go")({
                    experimental = {
                        test_table = true,
                    },
                    args = {
                        "-tags='tests integration test mock lasting'",
                        "-coverprofile=" .. vim.fn.getcwd() .. "/build/cover.out",
                    },
                }),
            },
        }
        local neotest = require("neotest")
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
        neotest.setup(opts)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UseNeovimLsp", {}),
            callback = function(ev)
                wk.register(neotest_bindings(neotest, ev.buf), opts_bindings)
            end,
        })
    end,
}

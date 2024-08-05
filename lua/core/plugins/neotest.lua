local neotest_bindings = function(neotest, buffer)
    -- TODO: Due to some issue only the very first run along with opening
    -- panels causes issue for golang, neotest can not find test at all
    local first_usage = true
    local open_panels = function(run_fn)
        return function()
            if first_usage then
                vim.fn.timer_start(1000, run_fn)
                first_usage = false
            else
                run_fn()
            end
            neotest.summary.open()
            neotest.output_panel.open()
        end
    end

    return {
        { "<leader>t",  group = "Tests" },
        { "<leader>tc", open_panels(neotest.run.run), desc = "Run current test", noremap = false, buffer = buffer },
        {
            "<leader>td",
            open_panels(function()
                neotest.run.run(vim.fn.expand("%"))
            end),
            desc = "Run tests in directory",
            noremap = false,
            buffer = buffer,
        },

        {
            "<leader>tp",
            open_panels(function()
                -- TODO: Due to some reason does not work properly on first call or GoLang
                vim.fn.timer_start(1000, function()
                    neotest.run.run(vim.fn.getcwd())
                end)
            end),
            desc = "Run current test",
            noremap = false,
            buffer = buffer,
        },
        { "<leader>tx", neotest.run.stop, desc = "Stop tests", noremap = false, buffer = buffer },
        { "<leader>ti", group = "Panels" },
        {
            "<leader>tio",
            function()
                neotest.summary.open()
                neotest.output_panel.open()
            end,
            desc = "Open",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>tic",
            function()
                neotest.summary.close()
                neotest.output_panel.close()
            end,
            desc = "Close",
            noremap = false,
            buffer = buffer,
        },
        { "<leader>tis", neotest.summary.toggle,      desc = "Toggle summary", noremap = false, buffer = buffer },
        { "<leader>tiO", neotest.output_panel.toggle, desc = "Toggle output",  noremap = false, buffer = buffer },
    }
end

return {
    "nvim-neotest/neotest",
    lazy = false,
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
                        require("core.config.golang").build_tags,
                        "-coverprofile=" .. vim.fn.getcwd() .. "/build/cover.out",
                    },
                }),
            },
            discovery = {
                enabled = true,
            },
            running = {
                concurrent = false,
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
                wk.add(neotest_bindings(neotest, ev.buf))
            end,
        })
    end,
}

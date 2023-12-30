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
        t = {
            name = "Tests",
            c = { open_panels(neotest.run.run), "Run current test", noremap = false, buffer = buffer },
            d = {
                open_panels(function()
                    neotest.run.run(vim.fn.expand("%"))
                end),
                "Run test in directory",
                noremap = false,
                buffer = buffer,
            },
            p = {
                open_panels(function()
                    -- TODO: Due to some reason does not work properly on first call or GoLang
                    vim.fn.timer_start(1000, function()
                        neotest.run.run(vim.fn.getcwd())
                    end)
                end),
                "Run project tests",
                noremap = false,
                buffer = buffer,
            },
            x = {
                function()
                    neotest.run.stop()
                end,
                "Stop tests",
                noremap = false,
                buffer = buffer,
            },
            i = {
                name = "Panels",
                o = {
                    function()
                        neotest.summary.open()
                        neotest.output_panel.open()
                    end,
                    "Open",
                    noremap = false,
                    buffer = buffer,
                },
                c = {
                    function()
                        neotest.summary.close()
                        neotest.output_panel.close()
                    end,
                    "Close",
                    noremap = false,
                    buffer = buffer,
                },
                S = {
                    neotest.summary.toggle,
                    "Toggle summary",
                    noremap = false,
                    buffer = buffer,
                },
                O = {
                    neotest.output_panel.toggle,
                    "Toggle output",
                    noremap = false,
                    buffer = buffer,
                },
            },
        },
    }
end
local opts_bindings = { prefix = "<leader>" }
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
                        require("xproger.config.golang").build_tags,
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
                wk.register(neotest_bindings(neotest, ev.buf), opts_bindings)
            end,
        })
    end,
}

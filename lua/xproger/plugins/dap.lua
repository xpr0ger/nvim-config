local navigation_bindings = function(dap, buffer)
    return {
        d = {
            name = "Debug",
            b = {
                name = "Breakpoint",
                t = { dap.toggle_breakpoint, "Toggle breakpoint", noremap = false, buffer = buffer },
                s = { dap.set_breakpoint, "Setup breakpoint", noremap = false, buffer = buffer },
                l = {
                    function()
                        dap.set_breakpoint(nil, nil, vim.fn.input("Log breakpoint message:"))
                    end,
                    "Log breakpoint",
                    noremap = false,
                    buffer = buffer,
                },
            },
            s = { dap.repl_open, "Repl", noremap = false, buffer = buffer },
            l = {
                function()
                    require("dapui").open()
                    dap.run_last()
                end,
                "Run last",
                noremap = false,
                buffer = buffer,
            },
            u = { require("dapui").toggle, "Toggle Debug UI", noremap = true, buffer = buffer },
        },
    }
end

local general_bindings = function(dap, buffer)
    return {
        ["<F5>"] = {
            function()
                require("dapui").open()
                dap.continue()
            end,
            "Debug: Start/Continue",
            noremap = false,
            buffer = buffer,
        },
        ["<F6>"] = {
            function()
                require("dapui").close()
                dap.close()
            end,
            "Debug: Stop",
            noremap = false,
            buffer = buffer,
        },
        ["<F9>"] = { dap.step_back, "Debug: Step back", noremap = false, buffer = buffer },
        ["<F10>"] = { dap.step_over, "Debug: Step over", noremap = false, buffer = buffer },
        ["<F11>"] = { dap.step_into, "Debug: Step into", noremap = false, buffer = buffer },
        ["<F12>"] = { dap.step_out, "Debug: Step out", noremap = false, buffer = buffer },
    }
end

local binding_opts = { prefix = "<leader>" }

return {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function(_, _)
        local dap = require("dap")

        local wk = require("which-key")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserDapConfig", {}),
            callback = function(ev)
                wk.register(navigation_bindings(dap, ev.buf), binding_opts)
                wk.register(general_bindings(dap, ev.buf), {})
            end,
        })
    end,
}

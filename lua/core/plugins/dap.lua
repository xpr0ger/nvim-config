local navigation_bindings = function(dap, buffer)
    return {
        { "<leader>db",  group = "Breakpoint" },
        { "<leader>dbt", dap.toggle_breakpoint, desc = "Toggle breakpoint", noremap = true, buffer = buffer },
        { "<leader>dbs", dap.set_breakpoint,    desc = "Setup breakpoint",  noremap = true, buffer = buffer },
        {
            "<leader>dbl",
            function()
                dap.set_breakpoint(nil, nil, vim.fn.input("Log breakpoint message:"))
            end,

            desc = "Log breakpoint",
            noremap = true,
            buffer = buffer,
        },

        { "<leader>ds", dap.repl_open,           desc = "Repl",            noremap = true, buffer = buffer },
        { "<leader>du", require("dapui").toggle, desc = "Toggle Debug UI", noremap = true, buffer = buffer },
        {
            "<leader>dl",
            function()
                require("dapui").open()
                dap.run_last()
            end,
            desc = "Run last test",
            noremap = true,
            buffer = buffer,
        },
    }
end

local general_bindings = function(buffer)
    local dap = require("dap")
    return {
        { "<F5>",  dap.continue,  desc = "Debug: Start Continue", noremap = true },
        {
            "<F6>",
            function()
                dap.close()
                require("dapui").close()
            end,
            desc = "Debug: stop",
            noremap = false,
            buffer = buffer,
        },
        { "<F7>",  dap.step_into, desc = "Debug: Step into",      noremap = false, buffer = buffer },
        { "<F8>",  dap.step_over, desc = "Debug: Step over",      noremap = false, buffer = buffer },
        { "<F9>",  dap.step_back, desc = "Debug: Step back",      noremap = false, buffer = buffer },
        { "<F10>", dap.step_out,  desc = "Debug: Step out",       noremap = false, buffer = buffer },
    }
end

return {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function(_, _)
        local dap = require("dap")

        vim.cmd("highlight dap.bp guifg=#FF0000")
        vim.cmd("highlight dap.frame guifg=#00AA00")

        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "dap.bp" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "dap.db" })
        vim.fn.sign_define("DapLogPoint", { text = "", texthl = "dap.db" })
        vim.fn.sign_define("DapStopped", { text = "", texthl = "dap.frame" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "dap.db" })

        dap.listeners.before.event_terminated["close_ui"] = function(_, _)
            require("dapui").close()
        end

        dap.listeners.after.event_initialized["open_ui"] = function()
            require("dapui").open({ reset = true })
        end

        local wk = require("which-key")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserDapConfig", {}),
            callback = function(ev)
                wk.add(navigation_bindings(dap, ev.buf))
                wk.add(general_bindings(ev.buf))
            end,
        })
    end,
}

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

local general_bindings = function(dap, buffer)
    return {
        {
            "<F5>",
            function()
                require("dapui").open()
                dap.continue()
            end,

            desc = "Debug: Start Continue",
            noremap = true,
            buffer = buffer,
        },
        {
            "<F6>",
            function()
                require("dapui").close()
                dap.close()
            end,
            desc = "Debug: stop",
            noremap = false,
            buffer = buffer,
        },
        { "<F7>",  dap.step_into, desc = "Debug: Step into", noremap = false, buffer = buffer },
        { "<F8>",  dap.step_over, desc = "Debug: Step over", noremap = false, buffer = buffer },
        { "<F9>",  dap.step_back, desc = "Debug: Step back", noremap = false, buffer = buffer },
        { "<F10>", dap.step_out,  desc = "Debug: Step out",  noremap = false, buffer = buffer },
    }
end

return {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function(_, _)
        local dap = require("dap")

        local wk = require("which-key")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserDapConfig", {}),
            callback = function(ev)
                wk.add(navigation_bindings(dap, ev.buf))
                wk.add(general_bindings(dap, ev.buf))
            end,
        })
    end,
}

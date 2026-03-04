return function()
    defaultConfig = require("core.config.lsp.default-no-navic")()
    defaultConfig["filetypes"] = { "yaml.ansible", "yml" }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
        pattern = { "*/playbooks/*.yml", "*/rules/*.yml", "*/inventory/*.yml" },
        callback = function(args)
            vim.bo.filetype = "yaml.ansible"
        end,
    })
    return defaultConfig
end

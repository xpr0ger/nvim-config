vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.opt.listchars = {
    space = "·",
    tab = "╴╴󰌒",
    eol = "󰌑",
    nbsp = "␣",
    trail = "•",
    extends = "⟩",
    precedes = "⟨",
}
vim.opt.list = true
vim.opt.showbreak = "↪"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        prefix = function(diagnostic)
            local severity = diagnostic.severity
            if severity == vim.diagnostic.severity.ERROR then
                return ""
            elseif severity == vim.diagnostic.severity.WARN then
                return ""
            elseif severity == vim.diagnostic.severity.INFO then
                return "󰋼"
            elseif severity == vim.diagnostic.severity.HINT then
                return "󰟶"
            else
                return ""
            end
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = "󰟶",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.ERROR] = "",
        },
        linehl = {
            [vim.diagnostic.severity.HINT] = "Hint",
            [vim.diagnostic.severity.INFO] = "Info",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.ERROR] = "Error",
        },

        numhl = {
            [vim.diagnostic.severity.HINT] = "Hint",
            [vim.diagnostic.severity.INFO] = "Info",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.ERROR] = "Error",
        },
    },
    float = {
        source = true,
    },
    underline = true,
    update_in_insert = true,
})

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

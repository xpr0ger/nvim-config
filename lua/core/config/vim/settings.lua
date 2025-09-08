vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.clipboard = "unnamed"
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

local signs = {
    [vim.diagnostic.severity.HINT] = { icon = "󰟶", name = "Hint" },
    [vim.diagnostic.severity.INFO] = { icon = "󰋼", name = "Info" },
    [vim.diagnostic.severity.WARN] = { icon = "", name = "Warn" },
    [vim.diagnostic.severity.ERROR] = { icon = "", name = "Error" },
}

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
    float = {
        source = true,
    },
    underline = true,
    update_in_insert = false,
})

for _, sign_info in pairs(signs) do
    local hl = "DiagnosticSign" .. sign_info.name
    vim.fn.sign_define(hl, { text = sign_info.icon, texthl = hl, numhl = hl })
end

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

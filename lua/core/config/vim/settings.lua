vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.wo.relativenumber = true
vim.o.cursorline = true
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

local signs = {
    [vim.diagnostic.severity.HINT] = { icon = "󰟶", name = "Hint" },
    [vim.diagnostic.severity.INFO] = { icon = "󰋼", name = "Info" },
    [vim.diagnostic.severity.WARN] = { icon = "", name = "Warn" },
    [vim.diagnostic.severity.ERROR] = { icon = "", name = "Error" },
}

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        -- TODO: According to documentation can accept a function, but now it does not work.
        -- I should check this possibly later.
        prefix = "󱋉",
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

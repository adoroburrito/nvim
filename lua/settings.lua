vim.o.number = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.termguicolors = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.updatetime = 300

vim.o.background = 'light'
vim.cmd('colorscheme one-nvim')

require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}


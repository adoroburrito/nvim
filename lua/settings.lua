vim.o.number = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.termguicolors = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.updatetime = 300

vim.g["netrw_banner"] = 0
vim.g["netrw_liststyle"] = 3
vim.g["netrw_altv"] = 1
vim.g["netrw_winsize"] = 25

vim.o.background = 'light'
vim.cmd('colorscheme one-nvim')

require("indent_blankline").setup {
  char = "|",
  buftype_exclude = {"terminal"}
}

vim.g["coc_disable_transparent_cursor"] = 1

require("bufferline").setup{}


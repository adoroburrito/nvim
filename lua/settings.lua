vim.o.number = true
vim.o.expandtab = true
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

vim.g["coc_disable_transparent_cursor"] = 1

require("bufferline").setup{}
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'onelight',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


vim.g.mapleader = " "
local cmd = vim.cmd

local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")

-- coc.nvim
-- TO-DO: refactor this to lua
cmd("nmap <silent> gd <Plug>(coc-definition)")
cmd("nmap <silent> gy <Plug>(coc-type-definition)")
cmd("nmap <silent> gi <Plug>(coc-implementation)")
cmd("nmap <silent> gr <Plug>(coc-references)")

-- bufferLine.nvim
local bufferLine = {
  new_buffer = "<S-t>",
  newtab = "<C-t>b",
  close = "<S-x>",
  cycleNext = "<TAB>", -- next buffer
  cyclePrev = "<S-Tab>", -- previous buffer
}

map("n", bufferLine.new_buffer, ":enew<CR>") -- new buffer
map("n", bufferLine.newtab, ":tabnew<CR>") -- new tab
map("n", bufferLine.close, ":lua require('utils').close_buffer() <CR>") -- close  buffer

---- move between tabs
map("n", bufferLine.cycleNext, ":BufferLineCycleNext<CR>")
map("n", bufferLine.cyclePrev, ":BufferLineCyclePrev<CR>")

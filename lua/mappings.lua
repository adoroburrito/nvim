vim.g.mapleader = " "
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
    nowait = true,
    silent = true,
    noremap = true,
  }))
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

function esc(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local completion = {}

function completion.tab_completion()
  if vim.fn.pumvisible() > 0 then
    return esc('<C-n>')
  end

  if check_back_space() then
    return esc('<TAB>')
  end

  return vim.fn['coc#refresh']()
end

_G.nog.completion = completion

map("i", "<TAB>", "v:lua.nog.completion.tab_completion()", { expr = true, noremap = false })
map("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true, noremap = false })
map("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><C-r>=coc#on_enter()<CR>"', { expr = true, noremap = false })

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

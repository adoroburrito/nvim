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
map("n", "gd", "<Plug>(coc-definition)", { expr = false, noremap = false })
map("n", "gy", "<Plug>(coc-type-definition)", { expr = false, noremap = false })
map("n", "gi", "<Plug>(coc-implementation)", { expr = false, noremap = false })
map("n", "gr", "<Plug>(coc-references)", { expr = false, noremap = false })

map("n", "<Leader>rn", "<Plug>(coc-rename)", { expr = false, noremap = false })
map("x", "<Leader>ca", "<Plug>(coc-codeaction-selected)", { expr = false, noremap = false })

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
cmd('inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"')

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

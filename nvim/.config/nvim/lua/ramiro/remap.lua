local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '

-- mapleader not move the cursor in visual mode
map('v', '<leader>', '<Nop>')

-- oil file explorer
map("n", "<leader>pv", function()
  require("oil").open_float('.')
end)

map("n", "<leader>fv", function()
  require("oil").open_float()
end)

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate splits
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')
map('', '<A-h>', '<C-w>H')
map('', '<A-j>', '<C-w>J')
map('', '<A-k>', '<C-w>K')
map('', '<A-l>', '<C-w>L')

-- Navigate tabs
map('n', '<leader>h', 'gT')
map('n', '<leader>l', 'gt')
map('n', '<leader>cl', '<C-w>c')

-- Keep the curson in position when joining lines
map('n', 'J', 'mzJ`z')

-- Keep the cursor in position when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Keep the cursor in position when searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep the copy buffer when pasting
-- TODO not working
map("x", "<leader>p", "\"_dP")


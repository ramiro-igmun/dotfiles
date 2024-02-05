local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", function()
  require("oil").open_float('.')
end)

-- navigate splits
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

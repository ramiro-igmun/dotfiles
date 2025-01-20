-- `:help vim.opt`
-- `:help option-list`
--
o = vim.opt

-- Line numbers
o.number = true
o.relativenumber = true


-- Enable mouse mode
o.mouse = 'a'

-- The mode is already in the status line
o.showmode = false

-- Share clipboard with the OS.
-- Sheduled after 'UiEnter' to reduce startup-time
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

o.breakindent = true
o.undofile = true

-- Case insensitive search unless capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Always have a columns present for the signs -> try 'number'
o.signcolumn = 'yes'

o.updatetime = 250
o.timeoutlen = 300

o.splitright = true
o.splitbelow = true

o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

o.inccommand = 'split'

o.cursorline = true
o.scrolloff = 10
o.incsearch = true

o.tabstop = 2
-- vim: ts=2 sts=2 sw=2 et

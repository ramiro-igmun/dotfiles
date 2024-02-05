o = vim.opt

o.scrolloff = 3
o.termguicolors = true
o.number = true

-- Set the tab size and transform tabs to spaces
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.mouse = 'a'
-- Set clipboard to system clipboard
o.clipboard = 'unnamedplus'
-- "Highlight cursor line
o.cursorline = true
o.updatetime = 100

-- Highlight whitespaces
o.list = true
o.listchars = {tab = '>-', trail = '•', nbsp = '•'}
o.spelllang = 'en'

-- Search optrions
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

local opt = vim.opt
local g = vim.g
-- local o = vim.o

g.python_recommended_style = 0
g.rust_recommended_style = 0
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.copyindent = true
opt.indentkeys = "o,O,<Return>,0{,0},0),0],0>,!^F"

opt.lazyredraw = false

vim.g.mapleader = " "

opt.nu = true
opt.relativenumber = false -- L for using true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

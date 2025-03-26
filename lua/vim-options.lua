local opt = vim.opt
-- local g = vim.g
-- local o = vim.o

-- WARN: these options are hell
-- never ever use them again. here as warning
-- indentation goes all crazy if you uncomment these
-- g.python_recommended_style = 0
-- g.rust_recommended_style = 0

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.lazyredraw = false

vim.g.mapleader = " "

-- Indentation settings
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true -- Smart autoindenting when starting a new line
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.cindent = true -- Stricter indentation rules for C programs
opt.shiftwidth = 2 -- Number of spaces for each step of indent
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.softtabstop = 2 -- Number of spaces a tab counts for while editing
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'

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

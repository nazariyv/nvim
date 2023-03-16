-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- allows you to move selection block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- when moving through the page, the cursor stays in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- allows you to keep the searched term in the middle of the screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- if you have something like
-- foo
-- bar
-- and you select and copy foo
-- then select bar and paste in
-- first one will be foo, but then if you
-- press `p` again, it will be bar
-- this keymap ensures that subsequent hits
-- of `p` actually paste foo instead
-- greatest remap ever according to the primeagen
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next absolute greatest
-- credit: asbjornHaland
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- deleting into void register (doesn't get saved in buffer)
vim.keymap.set('n', '<leader>dd', "\"_d")
vim.keymap.set('v', '<leader>dd', "\"_d")

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- lets you substitute all the occurences of a word you are on
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- when you indent selection, stay in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- press quickly jk to emulare Esc key
vim.keymap.set('i', 'jk', '<ESC>')

-- write and close all windows
vim.keymap.set('n', '<leader>q', ':wqa<CR>')

-- for terminal toggle
vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=float<CR>')

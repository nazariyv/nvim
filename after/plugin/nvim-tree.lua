-- [[ Configure Nvim Tree ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', { desc = '[F]ile [E]xplorer' })

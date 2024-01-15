local vk = vim.keymap

-- General keymaps for normal mode
vk.set("n", ";", ":", { desc = "enter command mode", nowait = true })
vk.set("n", "<C-d>", "<C-d>zz", { desc = "when moving page down center" })
vk.set("n", "<C-u>", "<C-u>zz", { desc = "when moving page up center" })
vk.set('n', '<C-h>', '<C-w>h', { desc = "Window left" })
vk.set('n', '<C-l>', '<C-w>l', { desc = "Window right" })
vk.set('n', '<C-j>', '<C-w>j', { desc = "Window down" })
vk.set('n', '<C-k>', '<C-w>k', { desc = "Window up" })
vk.set('n', '<C-s>', '<cmd> w <CR>', { desc = "Save file" })
vk.set('n', '<C-c>', '<cmd> %y+ <CR>', { desc = "Copy whole file" })
vk.set("n", "<leader>y", '"+y', { desc = "yanks into +" })
vk.set("n", "<leader>Y", '"+Y', { desc = "yanks into +" })
vk.set("n", "<leader>d", '"_d', { desc = "delete into void" })
vk.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace all words" })
vk.set("n", "<leader>qq", ":wqa!<CR>", { desc = "write and close all" })
vk.set('n', '<leader>n', '<cmd> set nu! <CR>', { desc = "Toggle line number" })
vk.set('n', '<leader>rn', '<cmd> set rnu! <CR>', { desc = "Toggle relative number" })
vk.set("n", "n", "nzzzv", { desc = "allows search tersm to stay in the middle" })
vk.set("n", "N", "Nzzzv", { desc = "allows search terms to stay in the middle" })
vk.set('n', '<Esc>', '<cmd> noh <CR>', { desc = "Clear highlights" })
vk.set('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
vk.set('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
vk.set('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
vk.set('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
vk.set('n', '<leader>b', '<cmd> enew <CR>', { desc = "New buffer" })

-- see comment in misc.lua why I am not using tmux navigator
-- for tmux navigator
-- vk.set('n', '<C-h>', " <cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
-- vk.set('n', '<C-l>', " <cmd> TmuxNavigateRight<CR>", { desc = "window right" })
-- vk.set('n', '<C-j>', " <cmd> TmuxNavigateDown<CR>", { desc = "window down" })
-- vk.set('n', '<C-k>', " <cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- quickfix & loclist navigation
vk.set("n", "<A-j>", " <cmd> cnext<CR>zz", { desc = "navigate quickfix list next" })
vk.set("n", "<A-k>", " <cmd> cprev<CR>zz", { desc = "navigate quickfix list previous" })
vk.set("n", "<leader>k", " <cmd> lnext<CR>zz", { desc = "navigate location list next" })
vk.set("n", "<leader>j", " <cmd> lprev<CR>zz", { desc = "navigate location list previous" })

-- General keymaps for visual mode
vk.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move block down" })
vk.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move block up" })
vk.set("v", "<leader>y", '"+y', { desc = "yanks into +" })
vk.set("v", "<leader>d", '"_d', { desc = "delete into void" })
vk.set("v", "<", "<gv", { desc = "shift left and keep visual mode" })
vk.set("v", ">", ">gv", { desc = "shift right and keep visual mode" })
vk.set('v', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
vk.set('v', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- General keymaps for insert mode
vk.set("i", "<C-c>", "<Esc>", { desc = "leave insert mode in style" })

-- Nvim Tree specific keymaps for normal mode
vk.set("n", "th", function()
	local api = require("nvim-tree.api")
	api.tree.toggle_hidden_filter()
end, { desc = "Toggle hidden files in Nvim Tree" })

-- General keymaps for insert mode
vk.set('i', '<C-b>', '<ESC>^i', { desc = "Beginning of line" })
vk.set('i', '<C-e>', '<End>', { desc = "End of line" })
vk.set('i', '<C-h>', '<Left>', { desc = "Move left" })
vk.set('i', '<C-l>', '<Right>', { desc = "Move right" })
vk.set('i', '<C-j>', '<Down>', { desc = "Move down" })
vk.set('i', '<C-k>', '<Up>', { desc = "Move up" })

-- General keymaps for terminal mode
vk.set('t', '<C-x>', vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- General keymaps for select mode
vk.set('x', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
vk.set('x', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
vk.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Comment keymaps
vk.set('n', '<leader>/', function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle comment" })
vk.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })

-- LSP keymaps
vk.set('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP declaration" })
vk.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP definition" })
vk.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP hover" })
vk.set('n', 'gi', vim.lsp.buf.implementation, { desc = "LSP implementation" })
vk.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = "LSP signature help" })
vk.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "LSP definition type" })
vk.set('n', '<leader>fm', vim.lsp.buf.format, {})
-- vk.set('n', '<leader>ra', require("nvchad.renamer").open, { desc = "LSP rename" })
vk.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP code action" })
vk.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP references" })
vk.set('n', '<leader>lf', function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Floating diagnostic" })
vk.set('n', '[d', function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, { desc = "Goto prev" })
vk.set('n', ']d', function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, { desc = "Goto next" })
vk.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, { desc = "Diagnostic setloclist" })
-- vk.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, { desc = "Add workspace folder" })
-- vk.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, { desc = "Remove workspace folder" })
-- vk.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "List workspace folders" })
vk.set('v', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })

-- NvimTree keymaps
vk.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = "Toggle nvimtree" })
vk.set('n', '<leader>e', '<cmd> NvimTreeFocus <CR>', { desc = "Focus nvimtree" })

-- Telescope keymaps
vk.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { desc = "Find files" })
vk.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', { desc = "Find all" })
vk.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { desc = "Live grep" })
vk.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { desc = "Find buffers" })
vk.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { desc = "Help page" })
vk.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', { desc = "Find oldfiles" })
vk.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>', { desc = "Find in current buffer" })
vk.set('n', '<leader>cm', '<cmd> Telescope git_commits <CR>', { desc = "Git commits" })
vk.set('n', '<leader>gt', '<cmd> Telescope git_status <CR>', { desc = "Git status" })
vk.set('n', '<leader>pt', '<cmd> Telescope terms <CR>', { desc = "Pick hidden term" })
vk.set('n', '<leader>th', '<cmd> Telescope themes <CR>', { desc = "Nvchad themes" })
vk.set('n', '<leader>ma', '<cmd> Telescope marks <CR>', { desc = "Telescope bookmarks" })

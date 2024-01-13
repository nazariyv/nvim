local vk = vim.keymap

-- General keymaps for normal mode
vk.set("n", ";", ":", { desc = "enter command mode", nowait = true })
vk.set("n", "<C-d>", "<C-d>zz", { desc = "when moving page down center" })
vk.set("n", "<C-u>", "<C-u>zz", { desc = "when moving page up center" })
vk.set("n", "<leader>y", '"+y', { desc = "yanks into +" })
vk.set("n", "<leader>Y", '"+Y', { desc = "yanks into +" })
vk.set("n", "<leader>d", '"_d', { desc = "delete into void" })
vk.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace all words" })
vk.set("n", "<leader>qq", ":wqa!<CR>", { desc = "write and close all" })
vk.set("n", "n", "nzzzv", { desc = "allows search tersm to stay in the middle" })
vk.set("n", "N", "Nzzzv", { desc = "allows search terms to stay in the middle" })

-- for tmux navigator
vk.set('n', '<C-h>', " <cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
vk.set('n', '<C-l>', " <cmd> TmuxNavigateRight<CR>", { desc = "window right" })
vk.set('n', '<C-j>', " <cmd> TmuxNavigateDown<CR>", { desc = "window down" })
vk.set('n', '<C-k>', " <cmd> TmuxNavigateUp<CR>", { desc = "window up" })

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

-- General keymaps for insert mode
vk.set("i", "<C-c>", "<Esc>", { desc = "leave insert mode in style" })

-- Nvim Tree specific keymaps for normal mode
vk.set("n", "th", function()
	local api = require("nvim-tree.api")
	api.tree.toggle_hidden_filter()
end, { desc = "Toggle hidden files in Nvim Tree" })

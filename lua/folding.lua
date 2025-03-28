vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldopen:remove('block')

-- sadge...
-- folds are too slow with treesitter
-- ufo plugin is too buggy
-- cursed to never fold in neovim

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   callback = function()
--     vim.schedule(function()
--       vim.opt.foldmethod = "expr"
--       vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--       vim.opt.foldlevel = 99
--       vim.opt.foldlevelstart = 99
--       vim.opt.foldenable = true
--       vim.opt.foldcolumn = "1"
--       vim.opt.foldopen:remove('block')
--     end)
--   end
-- })
--
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   callback = function(args)
--     local ok, stats = pcall(vim.loop.fs_stat, args.match)
--     if ok and stats and stats.size > 1024 * 1024 then -- 1MB
--       vim.opt_local.foldenable = false
--     end
--   end
-- })

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- something about my rust cargo fmt on autosave that made all the folds
-- open
-- these two configs ensure that folds persist across saves
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.api.nvim_command("silent! mkview")
    end
})
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
        vim.api.nvim_command("silent! loadview")
    end
})

-- the following persist folds across neovim sessions
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*.*",
    callback = function()
        vim.cmd("mkview")
    end
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.*",
    callback = function()
        vim.cmd("silent! loadview")
    end
})

-- it does some retarded folds sometimes, despite tresitter config in there
-- but i have found after you za it, it figures out a proper fold
-- so this config does more good than bad for me, so I am keeping it for now
return {
  { 'kevinhwang91/promise-async' },
  -- Use UFO plugin for better folding experience
  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      -- Configure UFO
      require('ufo').setup({
        provider_selector = function()
          return { 'treesitter' }
        end
      })
      -- Recommended UFO keymaps
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      -- Prevent fold opening when using paragraph motions
      vim.keymap.set('n', '{', function()
          vim.cmd("keepjumps normal! {")
      end, { silent = true })

      vim.keymap.set('n', '}', function()
          vim.cmd("keepjumps normal! }")
      end, { silent = true })
    end,
  },
  -- {
  --   'olimorris/persisted.nvim',
  --   config = function()
  --     require('persisted').setup()
  --   end
  -- }
}

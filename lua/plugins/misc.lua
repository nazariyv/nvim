local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  -- poetry causes issues: https://github.com/christoomey/vim-tmux-navigator/issues/230
  -- to have tmux navigator work nominally, rather than running poetry shell
  -- and then nvim .
  -- do: poetry run nvim
  -- ! Note: this plugin requires tmux config as well
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equivalent to setup({}) function
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      server = {
        -- on_attach = on_attach,
        capabilities = capabilities,
      },
    },
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    'saecki/crates.nvim',
    ft = {'rust', 'toml'},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  }
}

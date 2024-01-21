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
}

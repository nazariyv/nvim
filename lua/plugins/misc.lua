return {
  -- it's commented out because of the following issue I experienced:
  -- having nvim tree open and some code buffer, as well as vertical split
  -- you will only switch between buffer and split OR nvim tree and split
  -- you will not switch between nvim tree -> buffer -> split
  -- outside of tmux, however, the following switching works
  -- I will just remove this plugin and use my terminal's (kitty) native tabs...
  -- {
  -- 	"christoomey/vim-tmux-navigator",
  -- 	lazy = false,
  -- },
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

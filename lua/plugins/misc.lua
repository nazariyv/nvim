return {
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
}

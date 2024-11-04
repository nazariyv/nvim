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
		"mrcjkb/rustaceanvim",
		version = "^4",
		lazy = false,
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}

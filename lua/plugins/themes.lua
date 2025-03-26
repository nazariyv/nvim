return {
	{
		"ellisonleao/gruvbox.nvim",
		-- priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			no_italic = true,
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			-- vim.o.background = "dark"
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "sainnhe/sonokai" },
	{ "shaunsingh/nord.nvim" },
	{ "neanias/everforest-nvim" },
	{ "kepano/flexoki" },
	{ "michael-ball/base16-horizon-scheme" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "savq/melange" },
	{ "kdheepak/monochrome.nvim" },
	{ "shaunsingh/oxocarbon.nvim" },
}

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					undo = {
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").restore,
								-- ["<C-u>"] = require("telescope-undo").undo_selection,
								-- ["<C-r>"] = require("telescope-undo").redo_selection,
							},
						},
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("undo")
		end,
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				extensions = {
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								-- freeze the current list and start a fuzzy search in the frozen list
								["<C-space>"] = lga_actions.to_fuzzy_refine,
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
				},
			})

			-- don't forget to load the extension
			telescope.load_extension("live_grep_args")
		end,
	},
}

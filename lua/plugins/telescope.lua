return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.5", -- leave it commented to use latest; or pin a known-good tag/commit
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						-- Lua patterns, not globs:
						"%.log$", -- any *.log file
						"/logs/", -- any path segment 'logs'
					},
				},
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),

					undo = {
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").restore,
								-- ["<C-u>"] = require("telescope-undo.actions").yank_additions,
								-- ["<C-r>"] = require("telescope-undo.actions").yank_deletions,
							},
						},
					},

					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<C-k>]"] = lga_actions.quote_prompt(), -- change if <C-k> conflicts
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								["<C-space>"] = lga_actions.to_fuzzy_refine,
							},
						},
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("undo")
			telescope.load_extension("live_grep_args")
		end,
	},
}

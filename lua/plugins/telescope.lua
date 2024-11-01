return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim"
    }
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
}

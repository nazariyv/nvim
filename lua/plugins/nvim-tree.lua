return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "right",
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
  end,
}

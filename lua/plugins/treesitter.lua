--
-- treesitter
--

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
      },
    },
  },
}

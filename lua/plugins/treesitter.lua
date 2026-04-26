--
-- treesitter
--

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.incremental_selection = {
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
      },
    }
    vim.list_extend(opts.ensure_installed, { "racket", "ini", "latex", "typst", "ziggy" })
  end,
}

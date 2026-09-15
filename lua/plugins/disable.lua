--
-- disabled plugins
--

return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}

--
-- word under cursor
--

return {
  "RRethy/vim-illuminate",
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "illuminatedCurWord", { bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "illuminatedWord", { bg = "NONE", underline = true })
    require("illuminate").configure(opts)
  end,
}

--
-- ayu
--

return {
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        overrides = {
          Function = { fg = "#dfbfff" },
          ["@lsp.type.parameter"] = { fg = "#95e6cb" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-mirage",
    },
  },
}

--
-- ayu
--

return {
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        overrides = vim.opt.background._value == "dark" and {
          Function = { fg = "#dfbfff" },
          ["@lsp.type.variable"] = {},
          ["@lsp.type.variable.go"] = {},
          ["@lsp.type.parameter.go"] = { fg = "#f28779" },
          ["@variable.parameter.go"] = { fg = "#f28779" },
          ["@variable.go"] = { fg = "#95e6cb" },
          ["@property.go"] = { fg = "#5ccfe6" },
        } or {},
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

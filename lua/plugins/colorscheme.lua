--
-- ayu
--

return {
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        overrides = vim.opt.background._value == "dark"
            and {
              Function = { fg = "#95e6cb" },
              ["@lsp.type.variable"] = {},
              ["@lsp.type.variable.go"] = {},
              ["@variable.go"] = {},
              ["@property.go"] = { fg = "#5ccfe6" },
              -- for all
              ["@lsp.type.parameter"] = { fg = "#dfbfff" },
              ["@variable.parameter"] = { fg = "#f28779" },
            }
          or {},
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-mirage",
    },
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

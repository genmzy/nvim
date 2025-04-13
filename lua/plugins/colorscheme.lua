--
-- rose-pine
--

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = { bold = true, italic = false },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-dawn",
    },
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

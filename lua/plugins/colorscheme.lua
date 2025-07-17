--
-- tokyonight
--

return {
  "tokyonight.nvim",
  opts = {
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
    },
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

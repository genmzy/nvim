--
-- tokyonight
--

return {
  "tokyonight.nvim",
  opts = {
    styles = {
      comments = { italic = (LocalConfig and LocalConfig.italic and LocalConfig.italic.comments) or false },
      keywords = { italic = (LocalConfig and LocalConfig.italic and LocalConfig.italic.keyword) or false },
      floats = "transparent",
      sidebars = "transparent",
    },
    transparent = true,
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

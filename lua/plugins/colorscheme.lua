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
      hl["@lsp.type.namespace.go"] = { fg = c.cyan }
      hl["@lsp.type.namespace.zig"] = { fg = c.cyan }
      hl["@lsp.type.string.zig"] = {}
      hl["BlinkCmpLabelMatch"] = { fg = c.teal }
      hl["@label"] = { fg = c.magenta }
      hl["@string.escape"] = { fg = c.purple }
    end,
  },
}

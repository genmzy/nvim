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
      hl["@lsp.type.namespace.go"] = { fg = c.cyan }
      hl["@lsp.type.namespace.zig"] = { fg = c.cyan }
      hl["@lsp.type.string.zig"] = {}
      hl["BlinkCmpLabelMatch"] = { fg = c.teal }
      hl["@label"] = { fg = c.magenta }
      hl["@string.escape"] = { fg = c.purple }
      hl["@lsp.type.string.go"] = {}
      hl["@character.printf"] = { fg = c.magenta }
      hl["@constant.builtin"] = { fg = c.orange }
    end,
  },
}

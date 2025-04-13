--
-- dracula
--

return {
  {
    "Mofiqul/dracula.nvim",
    config = {
      italic_comment = false,
      overrides = {
        Special = { fg = "#69ff94" },
        NormalFloat = { bg = "#313244" },
        StatusLine = { bg = "#44475a" },
        LspReferenceRead = { bold = true },
        LspReferenceText = { bold = true },
        LspReferenceWrite = { bold = true },
        PmenuSel = { fg = "#21222c", bg = "#8be9fd", bold = true },
        Pmenu = { fg = "#f8f8f2", bg = "#21222c" },
        CmpItemKind = { fg = "#f8f8f2" },
        CmpItemAbbr = { fg = "#f8f8f2" },
        CmpItemAbbrMatch = { fg = "#8be9fd" },
        TelescopeSelection = { fg = "#fef18c" },
        NoicePopupmenuMatch = { fg = "#69ff94" },
        ["@punctuation"] = { fg = "#7f849c" },
        ["@punctuation.bracket"] = { fg = "#7f849c" },
        ["@punctuation.delimiter"] = { fg = "#7f849c" },
        ["@function"] = { fg = "#69ff94" },
        ["@function.method"] = { fg = "#69ff94" },
        ["@function.macro"] = { fg = "#69ff94" },
        ["@operator"] = { fg = "#a4ffff" },
        ["@type.builtin"] = { fg = "#8be9fd" },
      },
    },
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

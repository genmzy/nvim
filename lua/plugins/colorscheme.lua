--
-- dracula
--

return {
  {
    "Mofiqul/dracula.nvim",
    config = {
      italic_comment = true,
      overrides = {
        NormalFloat = { bg = "#313244" },
        StatusLine = { bg = "#44475a" },
        LspReferenceRead = { bold = true },
        LspReferenceText = { bold = true },
        LspReferenceWrite = { bold = true },
        PmenuSel = { fg = "#21222c", bg = "#8be9fd", bold = true },
        TelescopeSelection = { fg = "#fef18c" },
        ["@punctuation"] = { fg = "#7f849c" },
        ["@punctuation.bracket"] = { fg = "#7f849c" },
        ["@punctuation.delimiter"] = { fg = "#7f849c" },
        ["@function"] = { fg = "#69ff94" },
        ["@function.method"] = { fg = "#69ff94" },
        ["@function.macro"] = { fg = "#69ff94" },
        ["@operator"] = { fg = "#a4ffff" },
      },
    },
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}

--
-- kanagawa
--

return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          FzfLuaDirPart = { fg = theme.syn.comment },
          LineNr = { bg = "NONE" },
          GitSignsAdd = { bg = "NONE" },
          GitSignsChange = { bg = "NONE" },
          GitSignsDelete = { bg = "NONE" },
          GitSignsTopdelete = { bg = "NONE" },
          GitSignsStagedAdd = { bg = "NONE" },
          GitSignsStagedChange = { bg = "NONE" },
          GitSignsStagedDelete = { bg = "NONE" },
          GitSignsStagedTopdelete = { bg = "NONE" },
        }
      end,
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
    },
  },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}

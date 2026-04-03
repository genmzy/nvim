--
-- catppuccin
--

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "catppuccin",
    opts = {
      styles = {
        conditionals = {},
        miscs = {},
      },
      custom_highlights = function(colors)
        return {
          PmenuMatch = { fg = colors.lavender, bold = true },
          Search = { bg = colors.lavender, fg = colors.base },
          Comment = { fg = colors.surface2 },
          Macro = { fg = colors.pink },
          ["@module"] = { fg = colors.sky },
        }
      end,
    },
  },
}

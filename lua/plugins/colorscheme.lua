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
      custom_highlights = function(colors)
        return {
          PmenuMatch = { fg = colors.lavender },
          Search = { bg = colors.lavender, fg = colors.base },
        }
      end,
    },
  },
}

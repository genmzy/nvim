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
      no_italic = true,
      styles = {
        conditionals = {},
        miscs = {},
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          PmenuMatch = { fg = colors.flamingo, bold = true },
          Search = { bg = colors.lavender, fg = colors.base },
          Comment = { fg = colors.surface2, style = { "italic" } },
          Macro = { fg = colors.pink },
          RainbowDelimiterRed = { fg = colors.pink },
          MatchParen = { bg = colors.surface1, fg = "NONE", bold = false },
          ["@module"] = { fg = colors.pink },
          ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.blue }, -- difference builtin and default library font
          ["@function.builtin"] = { fg = colors.red },
          ["@namespace.builtin"] = { fg = colors.red },
          ["@variable.parameter"] = { fg = colors.flamingo },
        }
      end,
    },
  },
}

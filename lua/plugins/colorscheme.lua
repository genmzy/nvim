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
          PmenuMatch = { fg = colors.lavender, bold = true },
          Search = { bg = colors.lavender, fg = colors.base },
          Comment = { fg = colors.surface2, style = { "italic" } },
          Macro = { fg = colors.pink },
          RainbowDelimiterRed = { fg = colors.pink },
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

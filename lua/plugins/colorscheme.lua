--
-- catppuccin
--

local dark_visual = "#252538"

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
      no_bold = true,
      color_overrides = {
        mocha = { yellow = "#f9e7af" },
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          PmenuMatch = { fg = colors.rosewater, bold = true },
          Search = { bg = colors.lavender, fg = colors.base },
          Comment = { fg = colors.surface2, style = { "italic" } },
          Macro = { fg = colors.pink },
          RainbowDelimiterRed = { fg = colors.pink },
          MatchParen = { bg = colors.surface1, fg = "NONE", bold = false },
          FzfLuaHeaderBind = { fg = colors.pink },
          FzfLuaHeaderText = { fg = colors.blue, bold = true },
          BlinkCmpMenuSelection = { bg = dark_visual },
          Visual = { bg = colors.surface0 },
          LspReferenceTarget = { bg = "NONE" },
          kamailioIdentifier = { link = "Function" },
          SnacksIndentScope = { fg = colors.overlay0 },
          ["@module"] = { fg = colors.pink },
          ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.blue }, -- difference builtin and default library font
          ["@function.builtin"] = { fg = colors.red },
          ["@namespace.builtin"] = { fg = colors.red },
          ["@variable.parameter"] = { fg = colors.flamingo },
          ["@keyword.import.c"] = { fg = colors.mauve },
          ["@keyword.import.cpp"] = { fg = colors.mauve },
        }
      end,
    },
  },
}

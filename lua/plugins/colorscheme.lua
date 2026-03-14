--
-- everforest
--

local kind = {
  Text = "Normal",
  Class = "Lsp",
  Interface = "Orange",
  Module = "Yellow",
  Unit = "Purple",
  Enum = "Green",
  Snippet = "Aqua",
  Color = "Normal",
  File = "Normal",
  Reference = "Aqua",
  Folder = "Blue",
  EnumMember = "Purple",
  Struct = "Yellow",
  Event = "Orange",
  TypeParameter = "TSParameter",

  "Method",
  "Function",
  "Constructor",
  "Field",
  "Variable",
  "Property",
  "Value",
  "Keyword",
  "Constant",
  "Operator",
}

return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("everforest").setup({
        background = "medium",
        colours_override = function(palette)
          palette.blue = "#35989F" -- or 3482AC
          palette.purple = "#DC5597"
          palette.statusline1 = palette.green
        end,
        on_highlights = function(hl, palette)
          hl.TSParameter = { fg = palette.aqua, bg = palette.none, bold = false }
          hl.TSPunctBracket = { fg = palette.grey0, bg = palette.none, bold = false }
          hl.jsonString = { link = "String" }
          hl.FzfLuaDirPart = { fg = palette.grey2 }
          hl.BlinkCmpLabelMatch = { fg = palette.orange }
          hl.LspSignatureActiveParameter = { bg = palette.bg4, bold = true }
          hl.BlinkCmpMenuSelection = { bg = palette.bg4, bold = true }
          for k, v in pairs(kind) do
            if tonumber(k) then
              hl["BlinkCmpKind" .. v] = { link = "TS" .. v }
            else
              hl["BlinkCmpKind" .. k] = { link = v }
            end
          end
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}

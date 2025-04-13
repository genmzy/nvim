--
-- everforest
--

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
        background = "soft",
        colours_override = function(palette)
          palette.blue = "#35989F" -- or 3482AC
          palette.purple = "#DC5597"
          palette.statusline1 = palette.green
        end,
        on_highlights = function(hl, palette)
          hl.TSParameter = { fg = palette.aqua, bg = palette.none, bold = false }
          hl.TSPunctBracket = { fg = palette.grey0, bg = palette.none, bold = false }
          hl.jsonString = { link = "String" }
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

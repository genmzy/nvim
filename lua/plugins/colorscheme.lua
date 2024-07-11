--
-- gruvbox
--

return {
  {
    "ellisonleao/gruvbox.nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      local gruvbox = require("gruvbox").palette
      ---@diagnostic disable-next-line: missing-fields
      require("gruvbox").setup({
        ---@diagnostic disable-next-line: missing-fields
        italic = { strings = false, emphasis = false },
        bold = false,
        overrides = {
          ["PmenuSel"] = { bold = true },
          ["IncSearch"] = { bold = true },
          ["Search"] = { bold = true },
          ["ErrorMsg"] = { bold = true },
          ["DiffText"] = { bold = true },
          ["Cursor"] = { bold = true },
          ["GruvboxBlueSign"] = { bg = gruvbox.dark0 },
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

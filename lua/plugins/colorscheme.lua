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
      -- vim.g["terminal_color_bg"] = gruvbox.dark0
      ---@diagnostic disable-next-line: missing-fields
      require("gruvbox").setup({
        ---@diagnostic disable-next-line: missing-fields
        italic = { strings = false, emphasis = false },
        bold = false,
        contrast = "hard",
        overrides = {
          ["PmenuSel"] = { bold = true },
          ["IncSearch"] = { bold = true },
          ["Search"] = { bold = true },
          ["ErrorMsg"] = { bold = true },
          ["DiffText"] = { bold = true },
          ["Cursor"] = { bold = true },
          ["Visual"] = { bg = gruvbox.dark0_soft },
          ["StatusLine"] = { bg = gruvbox.dark0, fg = gruvbox.dark0 },
          ["Pmenu"] = { bg = gruvbox.dark0_soft },
          ["NormalFloat"] = { bg = gruvbox.dark0_soft },
          ["GruvboxBlueSign"] = { bg = gruvbox.dark0_hard },
          ["GitSignsCurrentLineBlame"] = { fg = gruvbox.dark3 },
          ["DiagnosticSignError"] = { bg = gruvbox.dark0_hard, fg = gruvbox.neutral_red },
          ["NeoTreeRootName"] = { fg = gruvbox.gray, bold = true },
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

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
          ["GitSignsCurrentLineBlame"] = { fg = gruvbox.dark3 },
          ["GruvboxBlueSign"] = { bg = "" },
          ["GruvboxRedSign"] = { bg = "" },
          ["GruvboxGreenSign"] = { bg = "" },
          ["GruvboxYellowSign"] = { bg = "" },
          ["GruvboxOrangeSign"] = { bg = "" },
          ["GruvboxAquaSign"] = { bg = "" },
          ["GruvboxPurpleSign"] = { bg = "" },
          ["CursorLineNr"] = { bg = "" },
          ["LspReferenceRead"] = { bg = gruvbox.dark1 },
          ["LspReferenceText"] = { bg = gruvbox.dark2 },
          ["LspReferenceWrite"] = { bg = gruvbox.dark1 },
          ["LspInlayHint"] = { fg = gruvbox.dark2 },
          ["NeoTreeRootName"] = { fg = gruvbox.gray, bold = true },
          ["NeoTreeTitleBar"] = { fg = gruvbox.dark0_hard, bg = gruvbox.gray, bold = true },
          ["TelescopeMultiSelection"] = { fg = gruvbox.neutral_yellow },
          ["@parameter"] = { fg = gruvbox.bright_aqua },
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

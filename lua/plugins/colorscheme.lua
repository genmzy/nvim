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
      local gb = require("gruvbox").palette
      local overrides = {
        ["Delimiter"] = { fg = gb.dark4 },
        ["Visual"] = { bg = gb.dark2 },
        ["StatusLine"] = { bg = gb.dark0, fg = gb.dark0 },
        ["Pmenu"] = { bg = gb.dark0_soft },
        ["NormalFloat"] = { bg = gb.dark0_soft },
        ["GitSignsCurrentLineBlame"] = { fg = gb.dark3 },
        ["CursorLineNr"] = { bg = "" },
        ["LspReferenceRead"] = { bg = gb.dark1 },
        ["LspReferenceText"] = { bg = gb.dark2 },
        ["LspReferenceWrite"] = { bg = gb.dark1 },
        ["LspInlayHint"] = { fg = gb.dark2 },
        ["NeoTreeRootName"] = { fg = gb.gray, bold = true },
        ["NeoTreeTitleBar"] = { fg = gb.dark0_hard, bg = gb.gray, bold = true },
        ["TelescopeMultiSelection"] = { fg = gb.neutral_yellow },
        ["IblScope"] = { fg = gb.light4 },
        ["@namespace"] = { fg = gb.bright_orange },
        ["@operator"] = { fg = gb.bright_orange },
        ["@parameter"] = { fg = gb.bright_aqua },
      }

      local gb_sign_color = { "Blue", "Red", "Green", "Yellow", "Orange", "Aqua", "Purple" }
      for _, v in ipairs(gb_sign_color) do
        overrides["Gruvbox" .. v .. "Sign"] = { bg = "" }
      end

      local md_hxxx_bg = { 0, "0_soft", 1, 2, 3, 4 }
      for i, v in ipairs(md_hxxx_bg) do
        overrides["RenderMarkdownH" .. i .. "Bg"] = { bg = gb["dark" .. v], bold = true }
      end

      local gb_custom_bold = {
        "PmenuSel",
        "IncSearch",
        "Search",
        "ErrorMsg",
        "DiffText",
        "Cursor",
        "markdownBold",
        "markdownBoldItalic",
        "@markup.strong",
      }
      for _, v in ipairs(gb_custom_bold) do
        overrides[v] = { bold = true }
      end

      ---@diagnostic disable-next-line: missing-fields
      require("gruvbox").setup({
        ---@diagnostic disable-next-line: missing-fields
        italic = { strings = false, emphasis = true, comments = false },
        bold = false,
        contrast = "hard",
        overrides = overrides,
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

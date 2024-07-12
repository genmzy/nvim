-- general modes
local alias = {
  n = "N", -- normal
  i = "I", -- insert
  c = "C", -- command
  v = "V", -- visual
  V = "VL", -- visual line
  s = "S", -- select
  R = "R", -- replace
  t = "T", -- terminal
  [""] = "VB", -- visual block
}

local gb = require("statusline.gruvbox")

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = gb,
      component_separators = {
        left = "",
        right = "",
      },
      section_separators = {
        left = "",
        right = "",
      },
    },
    sections = {
      lualine_a = {
        {
          function()
            return alias[vim.fn.mode()] or "?"
          end,
          icon = "󰊠",
          separator = {
            left = "", -- some color display ircorrectly
            right = "",
          },
          color = { gui = "bold" },
        },
      },
      lualine_b = {
        { "branch", icon = { "󰀘" } },
      },
      lualine_z = {
        {
          function()
            return " " .. os.date("%R")
          end,
          separator = {
            left = "",
            right = "",
          },
          color = { gui = "bold" },
        },
      },
    },
  },
}

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

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
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
          separator = { left = "", right = "" },
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
          separator = { left = "", right = "" },
        },
      },
    },
  },
}

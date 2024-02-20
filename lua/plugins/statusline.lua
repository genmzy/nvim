local alias = {
  n = "N",
  i = "I",
  c = "C",
  v = "V",
  V = "VL",
  s = "S",
  R = "R",
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
            return alias[vim.fn.mode()] or "VB"
            -- return vim.fn.mode()
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

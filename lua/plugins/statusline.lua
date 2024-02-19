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
        { "mode", separator = { left = "", right = "" } },
      },
      lualine_b = {
        { "branch", icon = { "" } },
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

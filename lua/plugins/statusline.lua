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
      lualine_b = {
        { "branch", icon = { "" } },
      },
    },
  },
}

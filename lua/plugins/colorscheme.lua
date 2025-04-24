--
-- tokyonight
--

vim.g.material_style = "palenight"

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
  {
    "marko-cerovac/material.nvim",
    opts = {
      transparent_background = true,
    },
  },
}

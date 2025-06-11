--
-- snazzy
--

return {
  {
    "ray-x/aurora",
    init = function()
      vim.g.aurora_italic = 0
      -- vim.g.aurora_transparent = 0
      vim.g.aurora_bold = 0
    end,
  },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aurora",
    },
  },
}

--
-- colorscheme
--

return {
  -- add gruvbox
  { "genmzy/forest.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "forest",
    },
  },
}

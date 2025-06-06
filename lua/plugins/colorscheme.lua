--
-- snazzy
--

return {
  {
    "genmzy/nvim-snazzy",
    dependencies = { "rktjmp/lush.nvim" },
  },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "snazzy",
    },
  },
}

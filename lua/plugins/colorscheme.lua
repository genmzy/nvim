--
-- snazzy
--

return {
  {
    -- "bbenzikry/snazzybuddy.nvim",
    -- dependencies = { "tjdevries/colorbuddy.nvim" },
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

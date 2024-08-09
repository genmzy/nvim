--
-- everforest
--

return {
  {
    "genmzy/deus.nvim",
    opts = {
      hard = true,
      disable_italic_comments = true,
      on_highlights = function(hl, p)
        hl.CurrentWord = { bg = p.bg1 }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "deus",
    },
  },
}

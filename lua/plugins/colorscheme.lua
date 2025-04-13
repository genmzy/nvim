--
-- everforest
--

return {
  {
    "genmzy/deus.nvim",
    opts = {
      hard = true,
      disable_italic_comments = require("local") and not require("local").italic.comments or false,
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
    on_highlights = function(hl, c)
      hl["@lsp.type.namespace.go"] = { fg = "#86e1fc" }
    end,
  },
}

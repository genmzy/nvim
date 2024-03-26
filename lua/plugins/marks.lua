local wk = require("which-key")
wk.register({ m = "+marks/translate" }, { prefix = "<leader>" })

return {
  "chentoast/marks.nvim",
  opts = {
    default_mappings = false,
  },
  lazy = false,
  keys = {
    { [[<leader>m]], mode = { "n", "x" }, desc = "+marks" },
    { [[<leader>mm]], mode = { "n", "x" }, "<Plug>(Marks-toggle)", desc = "Mark line" },
    { [[<leader>mb]], mode = { "n", "x" }, "<Plug>(Marks-deletebuf)", desc = "Delete buffer marks" },
    { [[<leader>mn]], mode = { "n", "x" }, "<Plug>(Marks-next)", desc = "Next mark" },
    { [[<leader>mN]], mode = { "n", "x" }, "<Plug>(Marks-prev)", desc = "Prev mark" },
  },
}

--
-- marks
--

local wk = require("which-key")
wk.add({
  { "<leader>m", group = "+marks/translate", icon = { icon = "󰍒", color = "azure" } },
})

return {
  "chentoast/marks.nvim",
  opts = {
    default_mappings = false,
  },
  lazy = false,
  keys = {
    { [[<leader>m]], mode = "n", desc = "+marks" },
    { [[<leader>mm]], mode = "n", "<Plug>(Marks-toggle)", desc = "Mark line" },
    { [[<leader>mb]], mode = "n", "<Plug>(Marks-deletebuf)", desc = "Delete buffer marks" },
    { [[<leader>mn]], mode = "n", "<Plug>(Marks-next)", desc = "Next mark" },
    { [[<leader>mN]], mode = "n", "<Plug>(Marks-prev)", desc = "Prev mark" },
  },
}

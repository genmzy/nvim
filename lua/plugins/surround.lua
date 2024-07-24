--
-- fix conflict with java go super
--

local wk = require("which-key")
wk.add({
  { "gz", group = "+surrounds", icon = { icon = "", color = "orange" } },
})

return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "gza", -- Add surrounding in Normal and Visual modes
      delete = "gzd", -- Delete surrounding
      find = "gzf", -- Find surrounding (to the right)
      find_left = "gzF", -- Find surrounding (to the left)
      highlight = "gzh", -- Highlight surrounding
      replace = "gzr", -- Replace surrounding
      update_n_lines = "gzn", -- Update `n_lines`
    },
  },
}

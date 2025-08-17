--
-- snacks explorer
--

return {
  "snacks.nvim",
  keys = {
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undotree",
    },
  },
  config = {
    scroll = { enabled = false },
    terminal = {
      win = {
        keys = {
          nav_h = false,
          nav_j = false,
          nav_k = false,
          nav_l = false,
        },
      },
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
      win = {
        -- input window
        input = {
          keys = {
            ["<c-u>"] = { "<c-s-u>", mode = { "i" }, expr = true },
            ["<esc>"] = { "close", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<esc>"] = { "close", mode = { "i", "n" } },
          },
        },
      },
    },
  },
}

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

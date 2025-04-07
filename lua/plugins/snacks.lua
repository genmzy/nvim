--
-- snacks explorer width
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
  opts = {
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
    },
  },
}

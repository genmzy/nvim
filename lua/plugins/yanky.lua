--
-- yanky history
--

return {
  "gbprod/yanky.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  keys = {
    {
      "sy",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      desc = "Yank History",
    },
  },
  opts = function()
    local mapping = require("yanky.telescope.mapping")
    local mappings = mapping.get_defaults()
    local p = mappings.i["<c-p>"]
    local P = mappings.i["<c-k>"]
    mappings.i["<c-k>"] = nil -- avoid <c-k> for telescope move
    mappings.i["<cr>"] = p -- use <cr> inherit default <c-p> yank action
    mappings.i["<c-p>"] = P -- use <c-p> inherit default <c-k> yank action
    return {
      highlight = { timer = 200 },
      ring = { storage = "sqlite" },
      picker = {
        telescope = {
          use_default_mappings = false,
          mappings = mappings,
        },
      },
    }
  end,
}

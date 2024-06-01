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
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    { "sp", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "sP", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  },
  opts = function()
    local mapping = require("yanky.telescope.mapping")
    local mappings = mapping.get_defaults()
    local p = mappings.i["<c-g>"]
    local P = mappings.i["<c-k>"]
    mappings.i["<c-k>"] = nil -- avoid <c-k> for telescope move
    mappings.i["<c-g>"] = nil -- avoid <c-k> for telescope move
    mappings.i["<cr>"] = p -- use <cr> inherit default <c-p> yank action
    mappings.i["<s-cr>"] = P -- use <c-p> inherit default <c-k> yank action
    mappings.i["<c-r>"] = P -- use <c-p> inherit default <c-k> yank action
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

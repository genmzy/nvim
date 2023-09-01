--
-- search and jump
--

return {
  "folke/flash.nvim",
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    {
      "ss",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "gs",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Go Visual Treesitter",
    },
  },
}

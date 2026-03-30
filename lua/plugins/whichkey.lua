--
-- which key
--

return {
  "folke/which-key.nvim",
  opts = {
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "s", mode = { "n", "x" } },
    },
    preset = "modern",
    win = {
      no_overlap = false,
      border = "rounded",
    },
  },
}

--
-- which key
--

return {
  "folke/which-key.nvim",
  opts = {
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "s", mode = { "n", "v" } },
    },
    preset = "modern",
    win = {
      no_overlap = false,
      border = "single",
    },
  },
}

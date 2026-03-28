--
-- dashboard
--

return {
  { "genmzy/Calendar.nvim" },
  {
    "snacks.nvim",
    opts = {
      -- logo = string.rep("\n", 8) .. logo .. "\n\n"
      dashboard = {
        preset = {
          -- Used by the `header` section
          header = [[]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        formats = {
          header = function()
            return { require("calendar").getCalendar(), align = "center", hl = "String" }
          end,
        },
      },
    },
  },
}

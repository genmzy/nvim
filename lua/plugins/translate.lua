--
-- chinese translator
--

for l in io.lines("/proc/1/cgroup") do
  if string.match(l, "docker") then
    return {}
  end
end

return {
  "JuanZoran/Trans.nvim",
  build = function()
    require("Trans").install()
  end,
  keys = {
    { "<leader>mt", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = "Translate" },
    { "<leader>mi", mode = "n", "<Cmd>TranslateInput<CR>", desc = "Translate From Input" },
  },
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    debug = false,
    theme = "tokyonight",
    strategy = { default = { frontend = "hover", backend = "youdao" } },
    frontend = {
      default = {
        auto_play = false,
        title = vim.fn.has("nvim-0.9") == 1 and {
          { "", "TransTitleRound" },
          { "󰊿 Trans", "TransTitle" },
          { "", "TransTitleRound" },
        } or nil, -- need nvim-0.9+
      },
      hover = {
        order = {
          youdao = {
            "title",
            "translation",
            "definition",
            "web",
          },
        },
        icon = {
          list = "●",
          star = "",
          notfound = "󰆆 ",
          yes = "✔",
          no = "",
          cell = "■",
          web = "󰖟 ",
          tag = "",
          pos = "",
          exchange = "",
          definition = "󰗊",
          translation = "󰊿",
        },
      },
    },
  },
}

--
-- chinese translator
--

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
      default = { auto_play = false },
      hover = {
        order = {
          youdao = {
            "title",
            "translation",
            "definition",
            "web",
          },
        },
      },
    },
  },
}

--
-- im select while normal mode
--

return {
  "genmzy/im-select.nvim",
  keys = {
    {
      "<leader>ui",
      "<cmd>ImSelectToggle<cr>",
      desc = "Im-Select Togggle",
    },
  },
  config = function()
    require("im_select").setup({})
  end,
}

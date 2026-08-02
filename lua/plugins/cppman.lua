-- cppman
return {
  "madskjeldgaard/cppman.nvim",
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  ft = { "cpp" },
  config = function()
    require("cppman").setup()
  end,
}

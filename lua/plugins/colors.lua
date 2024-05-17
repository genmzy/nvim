return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = vim.loop.os_uname().sysname == "Linux" and vim.o.background == "dark" or false,
    },
  },
}

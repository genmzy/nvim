local linux_and_dark = vim.loop.os_uname().sysname == "Linux" and vim.o.background == "dark"

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = linux_and_dark,
      styles = { sidebars = linux_and_dark and "transparent" or "dark" },
    },
  },
}

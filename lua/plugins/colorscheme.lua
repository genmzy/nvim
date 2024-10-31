--
-- tokyonight
--

return {
  "tokyonight.nvim",
  opts = {
    styles = {
      comments = { italic = (LocalConfig and LocalConfig.italic and LocalConfig.italic.comments) or false },
      keywords = { italic = (LocalConfig and LocalConfig.italic and LocalConfig.italic.keyword) or false },
    },
  },
}

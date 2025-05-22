--
-- leetcode
--

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "ibhagwan/fzf-lua",
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = vim.fn.argv()[1] ~= "leetcode.nvim",
  opts = {
    cn = {
      enabled = true,
      translator = true,
      translate_problems = true,
    },
    lang = "golang",
    storage = {
      home = os.getenv("GOPATH") .. "/src/leetcode",
    },
  },
}

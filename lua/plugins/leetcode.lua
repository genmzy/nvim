return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- telescope need
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
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
    storge = {
      home = os.getenv("GOPATH") .. "/src/leetcode",
      -- cache = os.getenv("GOPATH") .. "/src/leetcode_cache",
    },
  },
}

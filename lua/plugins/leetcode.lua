return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "ibhagwan/fzf-lua",
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
    storage = {
      home = os.getenv("GOPATH") .. "/src/leetcode",
    },
  },
}

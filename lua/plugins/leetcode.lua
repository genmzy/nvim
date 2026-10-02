--
-- leetcode
--

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  keys = {
    { "<leader>ll", "<cmd>Leet list<cr>", desc = "Leetcode List" },
    { "<leader>lr", "<cmd>Leet run<cr>", desc = "Leetcode Run" },
    { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Leetcode Submit" },
    { "<leader>lc", "<cmd>Leet console<cr>", desc = "Leetcode Console" },
    { "<leader>ld", "<cmd>Leet desc<cr>", desc = "Leetcode Description" },
    { "<leader>lh", "<cmd>Leet hints<cr>", desc = "Leetcode Hints" },
    { "<leader>li", "<cmd>Leet inject<cr>", desc = "Leetcode Inject" },
  },
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
    lang = "cpp",
    storage = {
      -- home = os.getenv("GOPATH") .. "/src/leetcode",
      home = ".",
    },
  },
}

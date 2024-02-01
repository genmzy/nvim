return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  lazy = vim.fn.argv()[1] ~= "leetcode.nvim",
  opts = {
    cn = {
      enabled = true,
      translator = true,
      translate_problems = true,
    },
    lang = "golang",
    directory = os.getenv("GOPATH") .. "/src/leetcode/",
  },
}

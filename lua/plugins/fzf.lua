--
-- fuzzy finder fzf
--

return {
  "fzf-lua",
  keys = {
    { "<leader>sp", "<cmd>FzfLua grep_project<cr>", desc = "Grep Project" },
    { "<leader>a", "<cmd>FzfLua grep_project<cr>", desc = "Grep Project" },
    { "<leader>l", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer Lines" },
    {
      "<leader><space>",
      function()
        if
          LazyVim.has("nvim-dap")
          and LazyVim.is_loaded("nvim-dap")
          and require("util.str").has_prefix(require("dap").status(), "Stopped at")
        then
          require("dap").continue()
        else
          LazyVim.pick("files")()
        end
      end,
      desc = "FindFile/DapContinue",
    },
  },
  opts = {
    keymap = {
      builtin = {
        ["<A-j>"] = "preview-down",
        ["<A-k>"] = "preview-up",
      },
      fzf = {
        ["ctrl-u"] = "unix-line-discard",
      },
    },
    winopts = {
      preview = { layout = "vertical", border = "single" },
      width = 0.9,
      height = 0.9,
      border = "single",
    },
  },
}

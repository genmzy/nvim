--
-- fuzzy finder fzf
--

return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
    build = "./install --bin",
  },
  keys = {
    {
      "<leader>a",
      "<cmd>Rg<cr>",
      desc = "Grep string",
    },
    {
      "<leader>l",
      "<cmd>BLines<cr>",
      desc = "Buffer fuzzy find",
    },
  },
  config = function()
    vim.g.fzf_layout = {
      window = {
        width = 0.9,
        height = 0.9,
        highlight = "TelescopeBorder",
        border = "rounded",
      },
    }
    vim.g.fzf_preview_window = { "up:50%:wrap" }
    vim.g.fzf_colors = {
      fg = { "fg", "Normal" },
      bg = { "bg", "Normal" },
      ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
      ["bg+"] = { "bg", "Keyword", "CursorColumn" },
      ["hl+"] = { "fg", "Statement" },
      info = { "fg", "PreProc" },
      border = { "fg", "Ignore" },
      prompt = { "fg", "Conditional" },
      pointer = { "fg", "Exception" },
      marker = { "fg", "Keyword" },
      spinner = { "fg", "Label" },
      header = { "fg", "Comment" },
    }
    vim.env.FZF_DEFAULT_OPTS = "--tabstop=2 --bind alt-j:preview-down,alt-k:preview-up"
    vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden -g !.git/ -g !.github/"
    vim.env.FZF_PREVIEW_COMMAND =
      "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || cat {}) 2> /dev/null"
  end,
}

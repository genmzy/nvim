local opencode_cmd = "opencode --port --continue"

---@type snacks.terminal.Opts
local snacks_terminal_opts = {
  count = 100, -- unique id to avoid collision with <ctrl-/> terminal in fzf picker
  win = {
    position = "right",
    width = 0.4,
    enter = false,
  },
}

local function opencode_toggle()
  Snacks.terminal.toggle(opencode_cmd, snacks_terminal_opts)
end

return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  keys = {
    {
      "<leader>a<space>",
      opencode_toggle,
      mode = { "n" },
      desc = "Toggle OpenCode",
    },
    {
      "<leader>am", -- menu
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Select OpenCode…",
    },
    {
      "<leader>aa",
      function()
        require("opencode").ask("@this: ")
      end,
      mode = { "n", "x" },
      desc = "Ask OpenCode…",
    },
    {
      "<leader>ab",
      function()
        return require("opencode").ask("@buffer: ")
      end,
      mode = { "n" },
      desc = "Line to OpenCode",
      expr = true,
    },
    {
      "<leader>as",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "x" },
      desc = "Range to OpenCode",
      expr = true,
    },
    {
      "<leader>as",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      mode = { "n" },
      desc = "Line to OpenCode",
      expr = true,
    },
    -- open code terminal shortcuts
    {
      "<a-k>",
      function()
        if vim.bo.filetype ~= "snacks_terminal" then
          return
        end
        require("opencode").command("session.half.page.up")
      end,
      mode = { "t" },
      desc = "Scroll OpenCode up",
    },
    {
      "<a-j>",
      function()
        if vim.bo.filetype ~= "snacks_terminal" then
          return
        end
        require("opencode").command("session.half.page.down")
      end,
      mode = { "t" },
      desc = "Scroll OpenCode down",
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }
  end,
}

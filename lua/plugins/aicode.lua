--
-- ai code
--

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

local function scroll_opencode(up)
  local ok = pcall(require, "opencode")
  if not ok then
    return
  end
  local entered = false
  for _, term in ipairs(Snacks.terminal.list()) do
    if vim.bo[term.buf].filetype == "snacks_terminal" then
      local info = vim.b[term.buf].snacks_terminal
      if info and info.cmd == opencode_cmd then
        entered = true
        break
      end
    end
  end
  if entered then
    require("opencode").command(up and "session.page.up" or "session.page.down")
  end
end

return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  keys = {
    {
      "<leader>a<space>",
      function()
        Snacks.terminal.toggle(opencode_cmd, snacks_terminal_opts)
      end,
      mode = { "n" },
      desc = "Toggle OpenCode",
    },
    {
      "<leader>a<tab>",
      function()
        require("opencode").command("agent.cycle")
      end,
      mode = { "n" },
      desc = "Switch OpenCode Agent/Mode",
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
      "<leader>ai",
      function()
        require("opencode").ask()
      end,
      mode = { "n", "x" },
      desc = "Ask OpenCode…",
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
        require("opencode").command("session.page.up")
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
        require("opencode").command("session.page.down")
      end,
      mode = { "t" },
      desc = "Scroll OpenCode down",
    },
    {
      "<leader>ak",
      function()
        scroll_opencode(true)
      end,
      mode = { "n" },
      desc = "Scroll OpenCode up",
    },
    {
      "<leader>aj",
      function()
        scroll_opencode(false)
      end,
      mode = { "n" },
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

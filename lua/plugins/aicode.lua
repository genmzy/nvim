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

local target_scroll = function(up)
  local cur = vim.api.nvim_get_current_win()
  -- only consider windows in the current tabpage (excludes statusline/floats/other tabs)
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins < 2 then
    return
  end
  -- pick the sibling window sharing an edge with the current one; fall back to
  -- the closest window under the cursor for robustness when many windows exist
  local target
  local best_dist = math.huge
  for _, win in ipairs(wins) do
    if win ~= cur and vim.api.nvim_win_get_config(win).relative == "" then
      local cpos = vim.api.nvim_win_get_position(cur)
      local tpos = vim.api.nvim_win_get_position(win)
      local dist = math.abs(cpos[1] - tpos[1]) + math.abs(cpos[2] - tpos[2])
      if dist < best_dist then
        best_dist = dist
        target = win
      end
    end
  end
  if not target then
    return
  end
  vim.api.nvim_set_current_win(target)
  local ctrl = up and 0x15 or 0x04 -- <c-d> (half page down) or <c-u> (half page up)
  vim.cmd("normal! " .. vim.fn.nr2char(ctrl))
  vim.api.nvim_set_current_win(cur)
end

local function opencode_terminal_live()
  local tab_wins = vim.api.nvim_tabpage_list_wins(0)
  for _, term in ipairs(Snacks.terminal.list()) do
    if vim.bo[term.buf].filetype == "snacks_terminal" then
      local info = vim.b[term.buf].snacks_terminal
      if info and info.cmd == opencode_cmd then
        -- only take precedence over plain sibling scrolling while the terminal
        -- window is actually visible in the current tabpage
        for _, win in ipairs(tab_wins) do
          if vim.api.nvim_win_get_buf(win) == term.buf then
            return true
          end
        end
      end
    end
  end
  return false
end

local function scroll_other_window(up)
  if pcall(require, "opencode") and opencode_terminal_live() then
    require("opencode").command(up and "session.page.up" or "session.page.down")
  else
    target_scroll(up)
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
      desc = "Toggle",
    },
    {
      "<leader>a<tab>",
      function()
        require("opencode").command("agent.cycle")
      end,
      mode = { "n" },
      desc = "Switch Agent/Mode",
    },
    {
      "<leader>am", -- menu
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Menu",
    },
    {
      "<leader>ac",
      function()
        require("opencode").command("prompt.clear")
      end,
      mode = { "n" },
      desc = "Clear Prompt",
    },
    {
      "<leader>ai",
      function()
        require("opencode").ask()
      end,
      mode = { "n", "x" },
      desc = "Input",
    },
    {
      "<leader>at",
      function()
        require("opencode").ask("@this: ")
      end,
      mode = { "n", "x" },
      desc = "This",
    },
    {
      "<leader>ab",
      function()
        return require("opencode").ask("@buffer: ")
      end,
      mode = { "n" },
      desc = "Buffer",
      expr = true,
    },
    {
      "<leader>as",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "x" },
      desc = "Select(visual)",
      expr = true,
    },
    {
      "<leader>as",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      mode = { "n" },
      desc = "Select(normal)",
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
      desc = "Scroll Up",
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
      desc = "Scroll Down",
    },
    {
      "<c-s-k>",
      function()
        scroll_other_window(true)
      end,
      mode = { "n" },
      desc = "Scroll Another Window Up",
    },
    {
      "<c-s-j>",
      function()
        scroll_other_window(false)
      end,
      mode = { "n" },
      desc = "Scroll Another Window down",
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

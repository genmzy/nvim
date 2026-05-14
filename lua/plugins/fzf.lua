--
-- fuzzy finder fzf
--

local function snacks_terminal_fzf()
  local fzf = require("fzf-lua")
  local terms = Snacks.terminal.list()
  local utils = require("fzf-lua.utils")

  local entries = {}
  for _, term in ipairs(terms) do
    -- format: [termial id] title
    local label = string.format(
      "[%d] %s",
      vim.api.nvim_buf_get_var(term.buf, "snacks_terminal").id,
      vim.api.nvim_buf_get_var(term.buf, "term_title") or "Shell"
    )
    table.insert(entries, label)
  end

  fzf.fzf_exec(entries, {
    fzf_opts = {
      ["--header"] = string.format(
        ":: <%s> to %s",
        utils.ansi_from_hl("FzfLuaHeaderBind", "ctrl-x"),
        utils.ansi_from_hl("FzfLuaHeaderText", "Close Terminal")
      ),
    },
    actions = {
      ["default"] = function(selected)
        if not selected or #selected == 0 then
          return
        end
        local term_id = tonumber(selected[1]:match("%[(%d+)%]"))
        for _, term in ipairs(terms) do
          if vim.api.nvim_buf_get_var(term.buf, "snacks_terminal").id == term_id then
            term:show()
            return
          end
        end
      end,
      -- <c-x> kill terminal session
      ["ctrl-x"] = function(selected)
        local term_id = tonumber(selected[1]:match("%[(%d+)%]"))
        for _, term in ipairs(terms) do
          if vim.api.nvim_buf_get_var(term.buf, "snacks_terminal").id == term_id then
            term:close({ force = true })
            break
          end
        end
        -- refresh the picker
        snacks_terminal_fzf()
      end,
    },
  })
end

return {
  "fzf-lua",
  keys = {
    { "<leader>sp", "<cmd>FzfLua grep_project<cr>", desc = "Grep Project" },
    { "<leader>a", "<cmd>FzfLua grep_project<cr>", desc = "Grep Project" },
    { "<leader>l", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer Lines" },
    { [[\t]], snacks_terminal_fzf, desc = "Terminals" },
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
      preview = { layout = "vertical" },
      width = 0.9,
      height = 0.9,
      -- border = "rounded",
    },
    defaults = {
      prompt = " ",
    },
  },
}

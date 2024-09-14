--
-- finder telescope
--

local actions = require("telescope.actions")

local function tele_not_selected(prompt_bufnr, _)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  return #picker:get_multi_selection() == 0
end

-- trouble select mselect or default
local function tb_mselect(prompt_bufnr, _mode)
  if tele_not_selected(prompt_bufnr, _mode) then
    actions.select_default(prompt_bufnr)
  else
    require("trouble.sources.telescope").open(prompt_bufnr, _mode)
  end
end

-- quickfixlist select mselect or default
local function qf_mselect(prompt_bufnr)
  if tele_not_selected(prompt_bufnr, _) then
    actions.select_default(prompt_bufnr)
  else
    actions.send_selected_to_qflist(prompt_bufnr)
    actions.open_qflist(prompt_bufnr)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "folke/trouble.nvim" },
  keys = {
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
    defaults = {
      -- winblend = 15, -- replaced by global configuration
      layout_strategy = "vertical",
      layout_config = { vertical = { preview_cutoff = 0 }, horizontal = { preview_cutoff = 0 } },
      path_display = { shorten = 2, truncate = 3 },
      scroll_strategy = "limit",
      prompt_prefix = "  ",
      mappings = {
        i = {
          ["<c-/>"] = "which_key",
          ["<c-k>"] = "move_selection_previous",
          ["<c-j>"] = "move_selection_next",
          ["<a-h>"] = "preview_scrolling_left",
          ["<a-l>"] = "preview_scrolling_right",
          ["<a-j>"] = "preview_scrolling_down",
          ["<a-k>"] = "preview_scrolling_up",
          ["<a-a>"] = "toggle_all",
          ["<esc>"] = "close",
          ["<c-u>"] = false,
          ["<c-p>"] = false,
          ["<c-n>"] = false,
          ["<c-d>"] = false,
          ["<a-t>"] = false,
          ["<c-a>"] = { "<home>", type = "command" },
          ["<c-e>"] = { "<end>", type = "command" },
          -- <c-t> for all entries to trouble
          -- NOTE: telescope yanky history mappings should override telescope <cr> mappings
          -- More specfics see plugins.yanky.lua
          ["<cr>"] = qf_mselect,
          ["<s-cr>"] = "select_default",
          ["<c-r>"] = tb_mselect,
        },
      },
    },
  },
}

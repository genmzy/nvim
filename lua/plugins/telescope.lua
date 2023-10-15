--
-- finder telescope
--

local function tele_not_selected(prompt_bufnr, _)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  return #picker:get_multi_selection() == 0
end

local function mselect(prompt_bufnr, _mode)
  if tele_not_selected(prompt_bufnr, _mode) then
    require("telescope.actions.set").select(prompt_bufnr, "default")
  else
    require("trouble.providers.telescope").open_selected_with_trouble(prompt_bufnr, _mode)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "folke/trouble.nvim" },
  opts = {
    defaults = {
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
          ["<esc>"] = "close",
          ["<c-u>"] = false,
          ["<c-p>"] = false,
          ["<c-n>"] = false,
          ["<c-d>"] = false,
          ["<a-t>"] = false,
          -- <c-t> for all entries to trouble
          ["<c-a>"] = "toggle_all",
          -- NOTE: telescope yanky history mappings should override telescope <cr> mappings
          -- More specfics see plugins.yanky.lua
          ["<cr>"] = "select_default",
          ["<s-cr>"] = mselect,
          ["<c-r>"] = mselect,
        },
      },
    },
  },
}

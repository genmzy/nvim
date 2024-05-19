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

local function has_prefix(s, h)
  return string.sub(s, 1, string.len(h)) == h
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "folke/trouble.nvim" },
  keys = {
    {
      "<leader><space>",
      function()
        if LazyVim.has("nvim-dap") and has_prefix(require("dap").status(), "Stopped at") then
          require("dap").continue()
        else
          LazyVim.telescope("files")()
        end
      end,
      desc = "FindFile/DapContinue",
    },
  },
  opts = {
    defaults = {
      winblend = 15,
      layout_strategy = (LocalConfig and LocalConfig.screen_horizontal) and "horizontal" or "vertical",
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

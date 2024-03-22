--
-- file explorer
--

local keymap = {
  ["<space>"] = {
    "toggle_node",
    nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
  },
  ["<2-LeftMouse>"] = "open",
  ["<cr>"] = "open",
  ["<esc>"] = "cancel", -- close preview or floating neo-tree window
  ["P"] = { "toggle_preview", config = { use_float = true } },
  ["u"] = function(state)
    local node = state.tree:get_node()
    require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
  end,
  ["l"] = "open",
  ["S"] = "open_vsplit",
  ["s"] = "noop",
  ["t"] = "open_tabnew",
  ["w"] = "open_with_window_picker",
  ["h"] = "close_node",
  ["z"] = "close_all_nodes",
  ["a"] = {
    "add",
    -- this command supports BASH style brace expansion ('x{a,b,c}' -> xa,xb,xc). see `:h neo-tree-file-actions` for details
    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
    config = {
      show_path = "none", -- 'none', 'relative', 'absolute'
    },
  },
  ["A"] = "add_directory", -- also accepts the optional config.show_path option like 'add'. this also supports BASH style brace expansion.
  ["d"] = "delete",
  ["r"] = "rename",
  ["yc"] = "copy_to_clipboard",
  ["x"] = "cut_to_clipboard",
  ["p"] = "paste_from_clipboard",
  ["y"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like 'add':
  ["cw"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like 'add'.
  ["q"] = "close_window",
  ["R"] = "refresh",
  ["?"] = "show_help",
  ["<"] = "prev_source",
  [">"] = "next_source",
  ["<c-f>"] = "fuzzy_finder",
  ["/"] = "noop",
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = keymap,
    },
  },
}

--
-- core keymaps
--

--| let &t_ut='' |--

local nx = { "n", "x" } -- mode normal and visual (besides select)
local nt = { "n", "t" } -- mode normal and terminal

-- NOTE: only for lazyvim
local unset_mapper = {
  { "<c-h>", nt },
  { "<c-j>", nt },
  { "<c-k>", nt },
  { "<c-l>", nt },
  { "<leader>bb" },
  { "<esc><esc>", "t" }, -- disable this to not trigger which_key in fzf
}

for _, map in ipairs(unset_mapper) do
  vim.keymap.del(map[2] or "n", map[1])
end

local redirect_mapper = {
  { "<leader>bb", "<leader>fb" }, -- buffer search
  { "<leader>si", "<leader>fr" }, -- history search
  { "<leader>mk", "<leader>sm" }, -- marks search
  { "sn", "]d" }, -- next diagnostic
  { "sN", "[d" }, -- prev diagnostic
  { "se", "]e" }, -- next error diagnostic
  { "sE", "[e" }, -- prev error diagnostic
  { "sv", "]w" }, -- next warning diagnostic
  { "sV", "[w" }, -- prev warning diagnostic
  { "gi", "gI" }, -- go impletetaion
  { "gl", "gD" }, -- go declaraction
  { "sr", "<leader>cr" }, -- rename variable/def_name
  { "so", "<leader>ca" }, -- code action
  { "sd", "<leader>sD" }, -- workspace diagnostics
  { "st", "<leader>st" }, -- todo list in comments
  { "sf", "<leader>cf", { "n", "v" } }, -- code format
  { "sm", "]f", { "n", "v" } },
  { "sM", "[f", { "n", "v" } },
  { "sc", "]c", { "n", "v" } },
  { "sC", "[c", { "n", "v" } },
  { "<leader>r", vim.lsp.buf.hover, "n", {} }, -- hover documentation
  { "<leader>gn", "<leader>]h" }, -- git next hunk
  { "<leader>gN", "<leader>[h" }, -- git prev hunk
  { "<leader>gr", "<leader>ghb" }, -- git reference
  { "<leader>gu", "<leader>ghr" }, -- git current
  { "<leader>gf", "<leader>gs" }, -- git stauts(files)
  { [[\t]], "<leader>fT" }, -- float terminal
  { [[\cc]], "gcc" }, -- comment current line
  { [[\cc]], "gc", "v" }, -- virsual comment
  { "<F4>", "<leader>cs" },
}

for _, map in ipairs(redirect_mapper) do
  vim.keymap.set(map[3] or "n", map[1], map[2], map[4] or { remap = true })
end

-- end NOTE

local keymapper = {
  { ".", "", nx },

  { "K", "5k", nx },
  { "J", "5j", nx },
  { "H", "14h", nx },
  { "L", "14l", nx },

  -- Resize splits with arrow keys, use lazyvim default keymaps
  -- { "<c-up>", "<cmd>res +5<cr>" },
  -- { "<c-down>", "<cmd>res -5<cr>" },
  -- { "<c-left>", "<cmd>vertical resize-5<cr>" },
  -- { "<c-right>", "<cmd>vertical resize+5<cr>" },

  { "S", "<cmd>w<cr>" },
  { "Q", "<cmd>q<cr>" },

  -- All fold expand for current buffer
  { "<leader>z", "zR" },
  { "<f3>", "<cmd>tabe<cr>" },
  { "<f8>", "<cmd>set splitright<cr><cmd>vsplit<cr>" },
  { "<f5>", "<cmd>set nosplitright<cr><cmd>vsplit<cr>" },
  { "<f7>", "<cmd>set nosplitbelow<cr><cmd>split<cr>" },
  { "<f6>", "<cmd>set splitbelow<cr><cmd>split<cr>" },

  -- s<direction> map to cross the split windows
  { "sh", "<c-w>h" },
  { "sj", "<c-w>j" },
  { "sk", "<c-w>k" },
  { "sl", "<c-w>l" },
  { "sw", "<c-w>w" },

  -- Leader n for not show search highlight
  { "<leader>n", "<cmd>noh<cr>" },

  -- Quick tabpage-change
  { "-", "<cmd>tabprevious<cr>" },
  { "=", "<cmd>tabnext<cr>" },

  -- Put a place holder to edit format-similar coding quickly
  { [[\\]], "<esc>/<++><cr><cmd>nohlsearch<cr>c4l" },

  -- Update: these are replaced by auto pair plugins
  -- Better code expandation in insert mode
  -- { '{', '{}<Left>', 'i' },
  -- { '(', '()<Left>', 'i' },
  -- { '[', '[]<Left>', 'i' },
  -- { '"', '""<Left>', 'i' },
  -- { "'", "''<Left>", 'i' },

  -- Better file editing expandation in insert mode for Chinese sign
  { "“", "“”<left>", "i" },
  { "‘", "‘’<left>", "i" },
  { "【", "【】<left>", "i" },
  { "（", "（）<left>", "i" },

  { ".", "%", nx },
  { "<c-n>", "<c-\\><c-n>", "t" },

  -- delete and enter insert mode for luasnip, coc set this by default
  { "<bs>", "<c-o>s", "s" },
  { "<c-h>", "<c-o>s", "s" },

  { "<leader>h", "<cmd>Man<cr>", nx },
}

for _, map in ipairs(keymapper) do
  vim.keymap.set(map[3] or "n", map[1], map[2], { noremap = true })
end

-- s-prefix
local wk = require("which-key")
wk.register({
  s = {
    n = "Next Diagnostic",
    N = "Prev Diagnostic",
    e = "Next Error",
    E = "Prev Error",
    v = "Next Warning",
    V = "Prev Warning",
    r = "Rename",
    o = "Code Action",
    d = "Workspace Diagnostics",
    t = "ToDo list",
    f = "Code Format",
    w = "Next Window",
    h = "Left Window",
    j = "Down Window",
    k = "Up Window",
    l = "Right Window",
    m = "Next Function",
    M = "Prev Function",
    c = "Next Class",
    C = "Prev Class",
    u = {
      name = "Sudo",
      r = "Read",
      w = "Write",
    },
  },
})
-- leader-prefix
wk.register({
  r = "Docs",
  g = {
    n = "Next Hunk",
    N = "Prev Hunk",
    r = "Git Reference",
    u = "Reset Chunk",
    f = "Changed Files",
  },
  bb = "Buffers",
  si = "History",
  mk = "Marks",
  n = "NoHlSearch",
  z = "Unzip All",
}, { prefix = "<leader>" })
-- others
wk.register({ g = { l = "Go Declaration" } })
wk.register({ ["\\"] = { t = "Float Terminal" } })
wk.register({ ["\\"] = { c = { name = "+comments", c = "Comment This" } } }, { mode = { "n", "v" } })

-- plugins keymaps --

local plugged = LazyVim.has

-- use accelerated jk --
if plugged("accelerated-jk.nvim") then
  vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
  vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
end

-- auto pairs maps --
local map_bs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end

if plugged("mini.pairs") then
  map_bs("<c-h>", "v:lua.MiniPairs.bs()")
  map_bs("<c-w>", 'v:lua.MiniPairs.bs("\23")')
  map_bs("<c-u>", 'v:lua.MiniPairs.bs("\21")')
end

-- hover documentation custom scroll keymaps --
if plugged("noice.nvim") and plugged("nvim-lspconfig") then
  vim.keymap.set("n", "<c-j>", function()
    if not require("noice.lsp").scroll(4) then
      return "<c-j>"
    end
  end, { silent = true, expr = true })
  vim.keymap.set("n", "<c-k>", function()
    if not require("noice.lsp").scroll(-4) then
      return "<c-k>"
    end
  end, { silent = true, expr = true })
end

if plugged("nvim-treesitter-context") then
  require("which-key").register({
    ["g."] = {
      function()
        require("treesitter-context").go_to_context()
      end,
      "Goto context",
    },
  }, { mode = { "n", "v" } })
end

if plugged("vim-dadbod-ui") then
  print("plugged dadbod")
  vim.keymap.del("n", "<leader>D")
  require("which-key").register({
    ["<leader>fd"] = {
      "<cmd>tabnew<cr><cmd>DBUIToggle<cr>",
      "DB Layout",
    },
  }, { mode = { "n" } })
end

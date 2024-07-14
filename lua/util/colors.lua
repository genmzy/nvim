local M = {}

M.lazy_color_prefixes = {
  "tokyonight",
  "catppuccin",
}

function M.is_lazy_color()
  for _, v in pairs(M.lazy_color_prefixes) do
    if require("util.str").has_prefix(vim.g.colors_name, v) then
      return true
    end
  end
  return false
end

return M

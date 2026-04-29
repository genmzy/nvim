--
-- string utils
--

local M = {}

function M.has_prefix(s, h)
  return string.sub(s, 1, string.len(h)) == h
end

function M.has_suffix(s, t)
  return string.sub(s, -string.len(t), -1) == t
end

return M

--
-- string utils
--

local M = {}

function M.has_prefix(s, h)
  return string.sub(s, 1, string.len(h)) == h
end

return M

local colors = {
  black = "#1d2021",
  white = "#ebdbb2",
  red = "#fb4934",
  green = "#b8bb26",
  green1 = "#8ec07c",
  blue = "#83a598",
  yellow = "#fe8019",
  orange = "#fabd2f",
  gray = "#a89984",
  darkgray = "#282828",
  lightgray = "#504945",
  inactivegray = "#7c6f64",
}

local hl = {}

hl.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.blue },
  c = { bg = colors.darkgray, fg = colors.gray },
}

hl.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.green },
}

hl.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.yellow },
}

hl.visual = {
  a = { bg = colors.orange, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.orange },
}

hl.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.red },
}

hl.terminal = {
  a = { bg = colors.green1, fg = colors.black },
  b = { bg = colors.lightgray, fg = colors.green1 },
}

hl.inactive = {
  a = { bg = colors.darkgray, fg = colors.blue },
  b = { bg = colors.darkgray, fg = colors.lightgray, gui = "bold" },
  c = { bg = colors.darkgray, fg = colors.lightgray },
}

return hl

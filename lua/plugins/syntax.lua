--
-- extra syntax
--

vim.g.rainbow_delimiters = {
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterRed",
    "RainbowDelimiterGreen",
    "RainbowDelimiterCyan",
    "RainbowDelimiterViolet",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
  },
}

return {
  -- kamailio/opensips
  {
    "kamailio/vim-kamailio-syntax",
    ft = { "kamailio" },
  },
  -- go plan 9 asm
  {
    "zchee/vim-goasm",
    ft = { "goasm" },
  },
  { "HiPhish/rainbow-delimiters.nvim" },
}

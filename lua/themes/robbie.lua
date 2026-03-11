-- Credits to original themes:
-- - https://github.com/Rigellute/rigel (main highlight)
-- - https://github.com/voronianski/oceanic-next-color-scheme (red accent reference)

local M = {}

M.base_30 = {
  white = "#d4dfe8",
  darker_black = "#001a25",
  black = "#00212b",
  black2 = "#002d3a",
  one_bg = "#001a25",
  one_bg2 = "#00212b",
  one_bg3 = "#002d3a",
  grey = "#607a86",
  grey_fg = "#688996",
  grey_fg2 = "#4e6a78",
  light_grey = "#567878",
  red = "#e06070",
  baby_pink = "#ff7585",
  pink = "#f0a0d0",
  line = "#00212b",
  green = "#9cf087",
  vibrant_green = "#7fc06e",
  nord_blue = "#7eb2dd",
  blue = "#1c8db2",
  yellow = "#f09040",
  sun = "#f8c040",
  purple = "#c080e8",
  dark_purple = "#d090f0",
  teal = "#00b8b8",
  orange = "#f09040",
  cyan = "#00e8e8",
  statusline_bg = "#002d3a",
  lightbg = "#183848",
  pmenu_bg = "#406878",
  folder_bg = "#90b8e8",
}

M.base_16 = {
  base00 = "#00212b",
  base01 = "#002d3a",
  base02 = "#183848",
  base03 = "#406878",
  base04 = "#607a86",
  base05 = "#d4dfe8",
  base06 = "#c0d0e0",
  base07 = "#f09040",
  base08 = "#e06070",
  base09 = "#ff7585",
  base0A = "#f09040",
  base0B = "#9cf087",
  base0C = "#00b8b8",
  base0D = "#1c8db2",
  base0E = "#c080e8",
  base0F = "#f0a0d0",
}

M.type = "dark"

M.polish_hl = {
  telescope = {
    TelescopePromptPrefix = { fg = M.base_30.white },
    TelescopeSelection = { bg = M.base_30.one_bg, fg = M.base_30.white },
  },

  treesitter = {
    ["@punctuation.bracket"] = { fg = M.base_30.nord_blue },
    ["@variable.parameter"] = { fg = M.base_16.base0A },
  },

  defaults = {
    FloatBorder = { fg = M.base_30.grey },
    Pmenu = { bg = M.base_30.black2 },
    Normal = { bg = M.base_30.black },
  },

  git = {
    DiffAdd = { fg = M.base_30.green },
    DiffChange = { fg = M.base_30.teal },
    DiffDelete = { fg = M.base_30.red },
    DiffText = { fg = M.base_30.white },
  },

  statusline = { St_pos_text = { fg = M.base_30.white } },

  syntax = {
    Constant = { fg = M.base_30.orange },
    String = { fg = M.base_30.green },
    Number = { fg = M.base_30.pink },
    Boolean = { fg = M.base_30.pink },
    Keyword = { fg = M.base_30.blue },
    Function = { fg = M.base_30.nord_blue },
    Type = { fg = M.base_30.orange },
    Variable = { fg = M.base_30.white },
    Identifier = { fg = M.base_30.orange },
  },
}

M = require("base46").override_theme(M, "robbie")

return M

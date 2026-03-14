-- Credits to original themes:
-- - https://github.com/Rigellute/rigel (main highlight)
-- - https://github.com/voronianski/oceanic-next-color-scheme (red accent reference)

local M = {}

M.base_30 = {
  white = "#E6E6DC",
  darker_black = "#001a25",
  black = "#00212b",
  black2 = "#002d3a",
  one_bg = "#334851",
  one_bg2 = "#4d5f66",
  one_bg3 = "#66767c",
  grey = "#607a86",
  grey_fg = "#688996",
  grey_fg2 = "#4e6a78",
  light_grey = "#567878",
  red = "#e06070",
  baby_pink = "#ff7585",
  pink = "#fb94ff",
  line = "#2e3e47",
  green = "#9cf087",
  vibrant_green = "#7fc06e",
  nord_blue = "#7eb2dd",
  blue = "#1c8db2",
  yellow = "#ffcc1b",
  sun = "#f8c040",
  purple = "#c694ff",
  dark_purple = "#d090f0",
  teal = "#00cccc",
  orange = "#f08e48",
  cyan = "#00ffff",
  statusline_bg = "#002d3a",
  lightbg = "#183848",
  pmenu_bg = "#406878",
  folder_bg = "#1c8db2",
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
  base09 = "#ffcc1b",
  base0A = "#f08e48",
  base0B = "#9cf087",
  base0C = "#00cccc",
  base0D = "#1c8db2",
  base0E = "#c694ff",
  base0F = "#fb94ff",
}

M.type = "dark"

M.polish_hl = {

  treesitter = {
    ["@punctuation.bracket"] = { fg = M.base_30.nord_blue },
    ["@variable.parameter"] = { fg = M.base_16.base0A },
    ["@constant"] = { fg = M.base_30.orange },
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
  nvimtree = {
    NvimTreeOpenedFolderName = { bold = true },
  },
}

M = require("base46").override_theme(M, "robbie")

return M

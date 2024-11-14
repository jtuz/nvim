---@type Base46Table
local M = {}

M.base_30 = {
  white = "#BAA67F",
  darker_black = "#121212", -- 6% darker than black
  black = "#1C1B19", -- usually your theme bg
  black2 = "#262626", -- 6% lighter than black
  one_bg = "#303030", -- 10% lighter than black
  one_bg2 = "#3A3A3A", -- 6% lighter than one_bg2
  one_bg3 = "#444444", -- 6% lighter than one_bg3
  grey = "#626262", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#6C6C6C",  -- 10% lighter than grey
  grey_fg2 = "#767676", -- 5% lighter than grey
  light_grey = "#8A8A8A",
  red = "#EF2F27",
  baby_pink = "#f48383",
  pink = "#ee9cdd",
  line = "#262626", -- 15% lighter than black
  green = "#519F50",
  vibrant_green = "#98BC37",
  nord_blue = "#68A8E4",
  blue = "#2C78BF",
  seablue = "#68A8E4",
  yellow = "#FBB829", -- 8% lighter than yellow
  sun = "#FED06E",
  purple = "#c47fd5",
  dark_purple = "#b570c6",
  teal = "#4F9F9F",
  orange = "#FF5F00",
  cyan = "#0AAEB3",
  statusline_bg = "#4E4E4E",
  lightbg = "#303030",
  pmenu_bg = "#519F50",
  folder_bg = "#2C78BF"
}

M.base_16 = {
  base00 = "#1C1B19",
  base01 = "#303030",
  base02 = "#3A3A3A",
  base03 = "#444444",
  base04 = "#626262",
  base05 = "#BAA67F",
  base06 = "#FCE8C3",
  base07 = "#BAA67F",
  base08 = "#EF2F27",
  base09 = "#FF5F00",
  base0A = "#FBB829",
  base0B = "#519F50",
  base0C = "#0AAEB3",
  base0D = "#2C78BF",
  base0E = "#c47fd5", -- it could be red
  base0F = "#F75341"
}

M.type = "dark"

M = require("base46").override_theme(M, "srcery")

return M

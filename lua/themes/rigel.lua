---@type Base46Table
local M = {}

M.base_30 = {
  white = "#e6e6dc",
  black = "#00384d", -- usually your theme bg
  darker_black = "#00293E", -- 6% darker than black
  black2 = "#0F475C", -- 6% lighter than black
  one_bg = "#1A5267", -- 10% lighter than black
  one_bg2 = "#296176", -- 6% lighter than one_bg2
  one_bg3 = "#387085", -- 6% lighter than one_bg3
  grey = "#669EB3", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#80B8CD", -- 10% lighter than grey
  grey_fg2 = "#73ABC0", -- 5% lighter than grey
  light_grey = "#586E75",
  red = "#c43061",
  baby_pink = "#575ea2",
  pink = "#849900",
  line = "#265E73", -- 15% lighter than black
  green = "#7fc06e",
  vibrant_green = "#9cf087",
  nord_blue = "#1a6397",
  blue = "#1c8db2",
  seablue = "#7eb2dd",
  yellow = "#f08e48", -- 8% lighter than yellow
  sun = "#ffcc1b",
  purple = "#29a298",
  dark_purple = "#B02669",
  teal = "#519ABA",
  orange = "#ff5a67",
  cyan = "#00cccc",
  statusline_bg = "#02202D",
  lightbg = "#03394F",
  pmenu_bg = "#29a298",
  folder_bg = "#268bd3"
}

M.base_16 = {
  base00 = "#00384d",
  base01 = "#c43060",
  base02 = "#7fc06e",
  base03 = "#f08e48",
  base04 = "#1c8db2",
  base05 = "#c694ff",
  base06 = "#00cccc",
  base07 = "#77929e",
  base08 = "#517f8d",
  base09 = "#ff5a67",
  base0A = "#9cf087",
  base0B = "#ffcc1b",
  base0C = "#7eb2dd",
  base0D = "#fb94ff",
  base0E = "#00ffff",
  base0F = "#b7cff9"
}

M.type = "dark"

M = require("base46").override_theme(M, "rigel")

return M

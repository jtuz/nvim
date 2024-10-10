---@type Base46Table
local M = {}

M.base_30 = {
  white = "#e6e6dc",
  darker_black = "#00293E", -- 6% darker than black
  black = "#00384d", -- usually your theme bg
  black2 = "#0F475C", -- 6% lighter than black
  one_bg = "#1A5267", -- 10% lighter than black
  one_bg2 = "#296176", -- 6% lighter than one_bg2
  one_bg3 = "#387085", -- 6% lighter than one_bg3
  grey = "#28535e",
  grey_fg = "#325d68",
  grey_fg2 = "#3c6772",
  light_grey = "#446f7a",
  red = "#c43061",
  baby_pink = "#ff5a67",
  pink = "#E688EA",
  line = "#265E73", -- 15% lighter than black
  green = "#6AA05B",
  vibrant_green = "#80c66F",
  nord_blue = "#1a6397",
  blue = "#22A3BC",
  seablue = "#22A3BC",
  yellow = "#E68845", -- 8% lighter than yellow
  sun = "#DFB218",
  purple = "#A67CD6",
  dark_purple = "#5d62b5",
  teal = "#519ABA",
  orange = "#ff5a67",
  cyan = "#00AFAF",
  statusline_bg = "#00384D",
  lightbg = "#03394F",
  pmenu_bg = "#29a298",
  folder_bg = "#268bd3"
}

M.base_16 = {
  base00 = "#02202D",
  base01 = M.base_30.black,
  base02 = M.base_30.black2,
  base03 = M.base_30.one_bg,
  base04 = M.base_30.one_bg2,
  base05 = M.base_30.grey,
  base06 = M.base_30.white,
  base07 = "#fdf6e3",
  base08 = M.base_30.red,
  base09 = M.base_30.orange,
  base0A = M.base_30.yellow,
  base0B = M.base_30.green,
  base0C = M.base_30.cyan,
  base0D = M.base_30.seablue,
  base0E = M.base_30.dark_purple,
  base0F = M.base_30.pink,
  -- base00 = "#00384d",
  -- base01 = "#c43060",
  -- base02 = "#7fc06e",
  -- base03 = "#f08e48",
  -- base04 = "#1c8db2",
  -- base05 = "#c694ff",
  -- base06 = "#00cccc",
  -- base07 = "#77929e",
  -- base08 = "#517f8d",
  -- base09 = "#ff5a67",
  -- base0A = "#9cf087",
  -- base0B = "#ffcc1b",
  -- base0C = "#7eb2dd",
  -- base0D = "#fb94ff",
  -- base0E = "#00ffff",
  -- base0F = "#b7cff9"
}

M.type = "dark"

M = require("base46").override_theme(M, "rigel")

return M

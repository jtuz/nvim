-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true, fg = "grey_fg" },
  ["@comment"] = { italic = true, fg = "grey_fg" },
  NvDashAscii = { bg = "#0E2738", fg = "red" },
  NvDashButtons = { bg = "#17415E", fg = "white" },
  NvimTreeRootFolder = { fg = "green" },
  WinBar = {
    bg = "statusline_bg",
  },
  WinBarNC = {
    bg = "statusline_bg",
  },
  WinSeparator = { fg = "nord_blue" },
  DapStopped = { fg = "green" },
}

---@type HLTable
M.add = {
  Nvim_navic = { fg = "red", bg = "statusline_bg" },
}

return M

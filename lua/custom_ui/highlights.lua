local M = {}

M.override = {
  Comment = { italic = true, fg = "grey_fg" },
  NvDashAscii = { bg = "#0E2738", fg = "red" },
  NvDashButtons = { bg = "#17415E", fg = "white" },
  NvimTreeRootFolder = { fg = "green" },
  WinBar = {
    cterm = "none",
    gui = "none",
  },
  -- WinBarNC = { bg="statusline_bg" }
}

M.add = {
  Nvim_navic = { fg = "red", bg = "statusline_bg" },
  -- WinBar = { bg = "statusline_bg" },
  -- WinBarNC = { bg="statusline_bg" }
}

return M

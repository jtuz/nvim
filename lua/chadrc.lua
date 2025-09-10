---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",
  -- theme to be used, check available themes with `<leader> + t + h`
  theme_toggle = { "gruvchad", "nord" },
  transparency = false,
  hl_override = {
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
  },
  hl_add = {
    Nvim_navic = { fg = "red", bg = "statusline_bg" },
    NavicIconsFile = { bg = "statusline_bg", fg = "base07" },
    NavicIconsModule = { bg = "statusline_bg", fg = "base0A" },
    NavicIconsNamespace = { bg = "statusline_bg", fg = "base0E" },
    NavicIconsPackage = { bg = "statusline_bg", fg = "base0E" },
    NavicIconsClass = { bg = "statusline_bg", fg = "teal" },
    NavicIconsMethod = { bg = "statusline_bg", fg = "base0D" },
    NavicIconsProperty = { bg = "statusline_bg", fg = "base08" },
    NavicIconsField = { bg = "statusline_bg", fg = "base08" },
    NavicIconsConstructor = { bg = "statusline_bg", fg = "blue" },
    NavicIconsEnum = { bg = "statusline_bg", fg = "blue" },
    NavicIconsInterface = { bg = "statusline_bg", fg = "green" },
    NavicIconsFunction = { bg = "statusline_bg", fg = "base0D" },
    NavicIconsVariable = { bg = "statusline_bg", fg = "base0E" },
    NavicIconsConstant = { bg = "statusline_bg", fg = "base09" },
    NavicIconsString = { bg = "statusline_bg", fg = "base08" },
    NavicIconsNumber = { bg = "statusline_bg", fg = "wnite" },
    NavicIconsBoolean = { bg = "statusline_bg", fg = "white" },
    NavicIconsArray = { bg = "statusline_bg", fg = "green" },
    NavicIconsObject = { bg = "statusline_bg", fg = "white" },
    NavicIconsKey = { bg = "statusline_bg", fg = "base07" },
    NavicIconsNull = { bg = "statusline_bg", fg = "white" },
    NavicIconsEnumMember = { bg = "statusline_bg", fg = "purple" },
    NavicIconsStruct = { bg = "statusline_bg", fg = "base0E" },
    NavicIconsEvent = { bg = "statusline_bg", fg = "yellow" },
    NavicIconsOperator = { bg = "statusline_bg", fg = "base05" },
    NavicIconsTypeParameter = { bg = "statusline_bg", fg = "base08" },
    NavicText = { bg = "statusline_bg", fg = "white" },
    NavicSeparator = { bg = "statusline_bg", fg = "grey_fg2" },
  },
  integrations = {
    "dap",
    "trouble",
    "todo",
  },
}

-- ui configs
M.ui = {
  cmp = {
    -- lspkind_text = false,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    icons = true,
    lspkind_text = true,
  },
  telescope = {
    style = "bordered", -- borderless / bordered
  },
  -- https://github.com/NvChad/NvChad/commit/16fadf9e0d53cf65a954486952ac3eba36d46788#commitcomment-139350293
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default", -- default/round/block/arrow
    order = {
      "mode",
      "customFile",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "customCwd",
      "customCursorPosition",
    },
    modules = {
      customFile = function()
        return require("custom_ui.statusline").FileInfo()
      end,
      customCwd = function()
        return require("custom_ui.statusline").Cwd()
      end,
      customCursorPosition = function()
        return require("custom_ui.statusline").CursorPosition()
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
    modules = {},
  },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "                                ",
    "⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⢿⣿⢿⡿⣟⣿⣟⣿⣶⣶⣤⣀⠀⠀⠀⠀⠀",
    "⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣯⣿⣾⣿⣾⣿⢿⣿⢿⣿⣻⣽⡿⣾⡷⣟⣿⢷⣦⠀⠀⠀",
    "⠀⢠⣾⣿⣿⣿⣿⡿⣿⣾⡉⣟⣉⡿⣷⣿⡿⣿⣻⣿⣽⣟⣿⣯⡿⣟⣿⣻⣽⢿⡄⠀",
    "⢠⣿⣿⣿⣿⣿⡿⣿⣯⣨⣿⣉⣿⢦⢾⡿⣻⣿⢿⣽⣾⣿⣽⣾⢿⣻⣯⣿⣽⣟⣿⡄",
    "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⠛⡧⢐⣴⠂⠞⠻⣿⣻⣷⢿⡷⣿⣟⣿⢷⡿⣾⣯⣷⣧",
    "⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣯⣏⣬⠈⠁⠁⠀⠀⠉⢿⣻⣿⣻⣯⣿⣽⣟⣿⣻⡾⣷⢿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠙⢽⣿⣽⣾⣯⣿⣽⣯⣿⣻⡿",
    "⣿⣿⣿⣿⣿⣿⣯⣿⣷⣿⣿⣿⣽⣿⣷⣄⠀⠀⠀⠀⠀⠀⠑⢿⣾⢷⡿⣾⢷⣟⣷⢿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣻⣽⣿⣯⣿⡿⠗⠀⠀⠀⠀⠀⠀⣼⣟⣿⣻⣟⣿⣽⣟⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣽⠟⠁⠀⠀⠀⠀⠀⣠⣾⢿⣽⣯⣿⣽⡷⣿⢾⣻",
    "⣿⣿⣿⣿⣿⣿⣯⣿⣿⣟⣯⣷⡟⠧⠀⠀⠀⠀⠀⢀⣴⣿⣻⣟⣿⡾⣷⣟⣿⣽⣟⣿",
    "⢿⣿⣿⣿⣿⣿⣿⡿⣟⣿⡿⣟⢐⣇⢸⣮⣀⡀⣴⣿⢿⣽⣿⣽⣷⢿⣯⡿⣷⣻⣽⡞",
    "⠘⣿⣿⣿⣿⣿⣿⣿⣿⡿⠦⣾⠛⣧⡴⣼⣤⣿⣿⣻⣿⣻⣾⢿⡾⣿⢷⣿⣻⣽⣷⠃",
    "⠀⠘⣿⣿⣿⣿⣷⣿⣿⣷⣾⠛⡾⠛⣤⣿⣯⣿⣾⣿⣽⣿⣽⣿⣻⣟⣿⣽⢿⣞⠃⠀",
    "⠀⠀⠈⠻⢿⣿⣿⣟⣯⣿⣿⣻⣿⣿⡿⣿⣽⣿⡾⣿⡾⣷⣿⢾⣿⣽⢿⡾⠛⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠉⠛⠿⠿⣿⡿⣿⣻⣷⣿⣿⢿⣾⡿⣟⣿⡿⣾⠿⠷⠛⠉⠀⠀⠀⠀⠀",
    "                                ",
    "       Powered By  eovim      ",
  },

  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files", no_gap = true },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles", no_gap = true },
    { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep", no_gap = true },
    { txt = "  Git Files", keys = "Spc f g", cmd = "Telescope git_files", no_gap = true },
    { txt = "  File Tree", keys = "Spc f t", cmd = "NvimTreeToggle", no_gap = true },
    { txt = "  Themes", keys = "Spc t h", cmd = "Telescope themes", no_gap = true },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true, align = "left" },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true, align = "left" },
  },
}

M.lsp = {
  signature = true,
}
M.mason = {
  cmd = true,
  pkgs = {
    "debugpy",
    "ruff",
    "delve",
    "cfn-lint",
  },
}

M.term = {
  base46_colors = true,
}

return M

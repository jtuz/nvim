---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  -- theme to be used, check available themes with `<leader> + t + h`
  theme_toggle = { "gruvchad", "tokyonight" },
  transparency = false,
  hl_override = {
    Comment = { italic = true, fg = "grey_fg" },
    ["@comment"] = { italic = true, fg = "grey_fg"  },
    NvDashAscii = { bg = "#0E2738", fg = "red" },
    NvDashButtons = { bg = "#17415E", fg = "white" },
    NvimTreeRootFolder = { fg = "green" },
    WinBar = {
      bg = "statusline_bg",
    },
  },
  hl_add = {
    Nvim_navic = { fg = "red", bg = "statusline_bg" },
  },
  integrations = {
    "dap",
    "trouble",
    "todo",
    "codeactionmenu",
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
    separator_style = "block", -- default/round/block/arrow
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
  nvdash = {
    load_on_startup = true,

    header = {
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
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Git Files", "Spc f g", "Telescope git_files" },
      { "  File Tree", "Spc f t", "NvimTreeToggle" },
      { "  Themes", "Spc t h", "Telescope themes" },
    },
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
  },
}

return M

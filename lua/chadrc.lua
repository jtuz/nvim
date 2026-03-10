---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.base46 = {
  theme = "oceanic-rigel",
  -- theme to be used, check available themes with `<leader> + t + h`
  theme_toggle = { "gruvchad", "oceanic-rigel" },
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
  integrations = {
    "dap",
    "trouble",
    "todo",
    "navic",
  },
}

-- ui configs
M.ui = {
  cmp = {
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    icons = true,
    lspkind_text = true,
  },
  telescope = {
    style = "bordered", -- borderless / bordered
  },
  -- https://github.com/NvChad/NvChad/commit/16fadf9e0d53cf65a954486952ac3eba36d46788#commitcomment-139350293
  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default", -- default/round/block/arrow
    order = {
      "mode",
      "file_info",
      "git",
      "%=",
      "lsp_msg",
      "%=",
       "mcp_hub_status",
      "python_venv",
      "diagnostics",
      "lsp",
      "custom_cwd",
      "cursor_position",
    },
    modules = require("custom.statusline").modules,
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
    modules = {},
  },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "                                    ",
    "  ⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⢿⣿⢿⡿⣟⣿⣟⣿⣶⣶⣤⣀⠀⠀⠀⠀⠀  ",
    "  ⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣯⣿⣾⣿⣾⣿⢿⣿⢿⣿⣻⣽⡿⣾⡷⣟⣿⢷⣦⠀⠀⠀  ",
    "  ⠀⢠⣾⣿⣿⣿⣿⡿⣿⣾⡉⣟⣉⡿⣷⣿⡿⣿⣻⣿⣽⣟⣿⣯⡿⣟⣿⣻⣽⢿⡄⠀  ",
    "  ⢠⣿⣿⣿⣿⣿⡿⣿⣯⣨⣿⣉⣿⢦⢾⡿⣻⣿⢿⣽⣾⣿⣽⣾⢿⣻⣯⣿⣽⣟⣿⡄  ",
    "  ⣾⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⠛⡧⢐⣴⠂⠞⠻⣿⣻⣷⢿⡷⣿⣟⣿⢷⡿⣾⣯⣷⣧  ",
    "  ⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣯⣏⣬⠈⠁⠁⠀⠀⠉⢿⣻⣿⣻⣯⣿⣽⣟⣿⣻⡾⣷⢿  ",
    "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠙⢽⣿⣽⣾⣯⣿⣽⣯⣿⣻⡿  ",
    "  ⣿⣿⣿⣿⣿⣿⣯⣿⣷⣿⣿⣿⣽⣿⣷⣄⠀⠀⠀⠀⠀⠀⠑⢿⣾⢷⡿⣾⢷⣟⣷⢿  ",
    "  ⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣻⣽⣿⣯⣿⡿⠗⠀⠀⠀⠀⠀⠀⣼⣟⣿⣻⣟⣿⣽⣟⣿  ",
    "  ⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣽⠟⠁⠀⠀⠀⠀⠀⣠⣾⢿⣽⣯⣿⣽⡷⣿⢾⣻  ",
    "  ⣿⣿⣿⣿⣿⣿⣯⣿⣿⣟⣯⣷⡟⠧⠀⠀⠀⠀⠀⢀⣴⣿⣻⣟⣿⡾⣷⣟⣿⣽⣟⣿  ",
    "  ⢿⣿⣿⣿⣿⣿⣿⡿⣟⣿⡿⣟⢐⣇⢸⣮⣀⡀⣴⣿⢿⣽⣿⣽⣷⢿⣯⡿⣷⣻⣽⡞  ",
    "  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡿⠦⣾⠛⣧⡴⣼⣤⣿⣿⣻⣿⣻⣾⢿⡾⣿⢷⣿⣻⣽⣷⠃  ",
    "  ⠀⠘⣿⣿⣿⣿⣷⣿⣿⣷⣾⠛⡾⠛⣤⣿⣯⣿⣾⣿⣽⣿⣽⣿⣻⣟⣿⣽⢿⣞⠃⠀  ",
    "  ⠀⠀⠈⠻⢿⣿⣿⣟⣯⣿⣿⣻⣿⣿⡿⣿⣽⣿⡾⣿⡾⣷⣿⢾⣿⣽⢿⡾⠛⠀⠀⠀  ",
    "  ⠀⠀⠀⠀⠀⠉⠛⠿⠿⣿⡿⣿⣻⣷⣿⣿⢿⣾⡿⣟⣿⡿⣾⠿⠷⠛⠉⠀⠀⠀⠀⠀  ",
    "                                    ",
    "         Powered By  eovim        ",
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
    "delve",
    "cfn-lint",
  },
}

M.term = {
  base46_colors = true,
}

return M

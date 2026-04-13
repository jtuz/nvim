require "nvchad.options"

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Some providers are disabled by default in NvChad
-- https://github.com/NvChad/NvChad/blob/09dd13e9c6df98fe5609829a7a0fbccea2f515ae/lua/nvchad/options.lua#L47

-- PLUGINS OPTIONS --
-- Vim Move by matze
g.move_key_modifier = "A"
g.move_key_modifier_visualmode = "A"

-- Friendly Snippets
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets"
---------------------

----------------Custom Settings----------------
g.markdown_fenced_languages = { "html", "python", "ruby", "vim", "bash", "go", "lua", "json" }
opt.mouse = ""
opt.cmdheight = 0
-- Experimental UI2: floating cmdline and messages
require("vim._core.ui2").enable {
  enable = true,
  msg = {
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = {
      [""] = "msg",
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
      typed_cmd = "cmd",
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
}
opt.shiftround = true
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.inccommand = "nosplit"
opt.wrap = false -- Do not wrap long lines
opt.list = true
opt.listchars = { eol = "↲", tab = "» ", trail = "·", extends = "▸", nbsp = "." }
opt.fillchars:append {
  vert = "▕", -- alternatives │
  msgsep = "‾",
  foldopen = "",
  foldclose = "",
  fold = "⋯",
  foldsep = "│",
  diff = "╱",
  eob = " ",
}

opt.diffopt = { "internal", "filler", "closeoff", "linematch:60", "vertical,context:99" }
opt.colorcolumn = "+1"
opt.wildignore = ".DS_Store,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
opt.cursorline = true
vim.o.cursorlineopt = "both"
vim.o.nrformats = "bin,hex,alpha"

-- triggers CursorHold event faster
opt.updatetime = 200

-- Override NvChad default settings
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Use rounded borders for floating windows.
vim.o.winborder = "rounded"

-- Command abbreviations
local abbreviations = {
  Q = "q",
  q1 = "q!",
  Q1 = "q!",
  Qa1 = "qa!",
  Qa = "qa",
  W = "w",
  Wq = "wq",
  WQ = "wq",
  Set = "set",
  SEt = "set",
  SET = "set",
}
for lhs, rhs in pairs(abbreviations) do
  cmd(string.format("cnoreabbrev %s %s", lhs, rhs))
end

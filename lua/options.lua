require "nvchad.options"

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Some providers are disabled by default in NvChad
-- https://github.com/NvChad/NvChad/blob/09dd13e9c6df98fe5609829a7a0fbccea2f515ae/lua/nvchad/options.lua#L47

-- Vim Move by matze
g.move_key_modifier = "A"
g.move_key_modifier_visualmode = "A"

----------------Custom Settings----------------
g.markdown_fenced_languages = { "html", "python", "ruby", "vim", "bash", "go", "lua" }
opt.mouse = ""
opt.cmdheight = 0
opt.shiftround = true
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.inccommand = "nosplit"
opt.wrap = false -- Do not wrap long lines
opt.list = true
opt.listchars = { eol = "↲", tab = "» ", trail = "·", extends = "▸", nbsp = "." }
opt.fillchars = {
  vert = "▕", -- alternatives │
  msgsep = "‾",
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = "│",
  diff = "╱",
  eob = " ",
}
opt.diffopt = { "internal", "filler", "closeoff", "linematch:60" }
opt.autoindent = true
opt.colorcolumn = "+1"
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- triggers CursorHold event faster
opt.updatetime = 200

-- Override NvChad default settings
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Abbrev
cmd "cnoreabbrev Q  q"
cmd "cnoreabbrev q1  q!"
cmd "cnoreabbrev Q1  q!"
cmd "cnoreabbrev Qa1 qa!"
cmd "cnoreabbrev Qa qa"
cmd "cnoreabbrev W  w"
cmd "cnoreabbrev Wq wq"
cmd "cnoreabbrev WQ wq"
cmd "cnoreabbrev Set set"
cmd "cnoreabbrev SEt set"
cmd "cnoreabbrev SET set"

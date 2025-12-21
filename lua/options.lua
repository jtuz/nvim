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
g.markdown_fenced_languages = { "html", "python", "ruby", "vim", "bash", "go", "lua", "json" }
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
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = "│",
  diff = "╱",
  eob = " ",
}
opt.diffopt = { "internal", "filler", "closeoff", "linematch:60", "vertical,context:99" }
opt.colorcolumn = "+1"
opt.wildignore = ".DS_Store,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
vim.o.cursorlineopt = "both"
opt.cursorline = true
-- opt.scrolloff = 10 -- Keep 10 lines above/below cursor
-- opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- triggers CursorHold event faster
opt.updatetime = 200

-- Override NvChad default settings
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Use rounded borders for floating windows.
vim.o.winborder = 'rounded'

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

require "nvchad.options"

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

----------------Nvim providers----------------
-- Due I use pyenv and rbenv, to avoid
-- install nvim modules for each virtualenv,
-- I declare a global prodiver for neovim

-- Python
g.python3_host_prog = "/usr/bin/python3"
-- Ruby
g.ruby_host_prog = "/usr/bin/ruby"
--
-- Disable providers we do not give a shit about
g.loaded_perl_provider = 0

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
opt.diffopt = { "internal", "filler", "closeoff", "linematch:60" }
opt.autoindent = true
opt.colorcolumn = "+1"
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- triggers CursorHold event faster
opt.updatetime = 200

-- Override NvChad default settings
opt.relativenumber = true
opt.tabstop = 4

-- Fold options
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldlevelstart = 1

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


vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- treesitter base folding
vim.opt_local.foldtext = "" -- enable sintax highlight on the first line
vim.opt_local.foldlevel = 99
vim.opt_local.foldlevelstart = 1
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

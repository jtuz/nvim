require "nvchad.autocmds"
-------------------- Auto commands -----------------------
-- Instead of reverting the cursor to the last position in the buffer
-- we set it to the first line when editing a git commit message
-- also Editor Config plugin is disabled on git commit message
local autocmd = vim.api.nvim_create_autocmd
local commit_group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "*.jenkinsfile", "*.Jenkinsfile" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
      -- vim.api.nvim_set_option_value('filetype', 'groovy', { scope = 'local', buf = bufnr })
      vim.api.nvim_buf_set_option(bufnr, "filetype", "groovy")
  end,
})

autocmd({ "FileType", "BufEnter" }, {
  pattern = { "gitcommit", "COMMIT_EDITMSG" },
  group = commit_group,
  callback = function()
    vim.b.editorconfig = false
    vim.cmd [[ call setpos('.', [0, 1, 1, 0]) ]]
  end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Enable spellchecking in markdown, gitcommit, text and html files
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "html", "htmldjango" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

autocmd("FileType", {
  pattern = { "help", "man", "gitsigns-blame", "qf", "git", "DiffviewFileHistory" },
  command = "nnoremap <buffer> gq <cmd>quit<cr>",
})

-- Fix conceallevel for json files
autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- barbecue autocmd
autocmd({
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  -- include this if you have set `show_modified` to `true`
  -- "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

require "nvchad.autocmds"

-------------------- Auto commands -----------------------
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup('nvim_jtuzp' .. name, { clear = true })
end

-- Instead of reverting the cursor to the last position in the buffer
-- we set it to the first line when editing a git commit message
-- also Editor Config plugin is disabled on git commit message
autocmd({ "FileType", "BufEnter" }, {
  pattern = { "gitcommit", "COMMIT_EDITMSG" },
  group = augroup("commit"),
  callback = function()
    vim.b.editorconfig = false
    vim.cmd [[ call setpos('.', [0, 1, 1, 0]) ]]
  end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- removes trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
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
  pattern = { "help", "man", "gitsigns-blame", "qf", "git", "trouble" },
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
  group = augroup("barbecue.updater"),
  callback = function()
    require("barbecue.ui").update()
  end,
})

-- resize splits if window got resized
autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- Eerimental features
autocmd("LspAttach", {
  callback = function (ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

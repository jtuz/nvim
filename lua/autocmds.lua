require "nvchad.autocmds"

-------------------- Auto commands -----------------------
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("nvim_jtuzp" .. name, { clear = true })
end

autocmd({ "FileType", "BufEnter" }, {
  pattern = { "gitcommit", "COMMIT_EDITMSG" },
  desc = "Set to the first line when editing a git commit message",
  group = augroup "commit",
  callback = function()
    vim.b.editorconfig = false
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end,
})

autocmd("BufReadPost", {
  pattern = "*",
  desc = "Go to last location when opening a buffer",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Removes trailing whitespace on save",
  callback = function()
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

autocmd("FileType", {
  desc = "Enable spellchecking in markdown, gitcommit, text and html files",
  pattern = { "gitcommit", "markdown", "text", "html", "htmldjango", "copilot-chat" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

autocmd("FileType", {
  desc = "Exit with gq",
  pattern = { "help", "man", "gitsigns-blame", "qf", "git", "trouble" },
  callback = function()
    vim.keymap.set("n", "gq", "<cmd>quit<cr>", { buffer = true, silent = true })
  end,
})

autocmd("FileType", {
  desc = "Fix conceallevel for json files",
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.conceallevel = 0
  end,
})

autocmd({ "VimResized" }, {
  desc = "Resize splits if window got resized",
  group = augroup "resize_splits",
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd("BufEnter", {
  desc = "Customize Copilot buffers",
  pattern = "copilot-*",
  group = augroup "Copilot",
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = true
    -- vim.opt_local.number = false
    -- vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup "treesitter_folding",
    desc = 'Enable Treesitter folding',
    callback = function(args)
        local bufnr = args.buf

        -- Enable Treesitter folding when not in huge files and when Treesitter
        -- is working.
        if vim.bo[bufnr].filetype ~= 'bigfile' and pcall(vim.treesitter.start, bufnr) then
            vim.api.nvim_buf_call(bufnr, function()
                vim.wo[0][0].foldmethod = 'expr'
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldtext = "" -- enable syntax highlight on the first line
                vim.cmd.normal 'zx'
            end)
        end
    end,
})

-- Eerimental features
-- autocmd("LspAttach", {
--   callback = function (ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method("textDocument/completion") then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end
-- })

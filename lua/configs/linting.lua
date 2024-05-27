local lint = require "lint"
lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }
lint.linters_by_ft = {
  python = { "flake8" },
  go = { "golangcilint" },
}
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

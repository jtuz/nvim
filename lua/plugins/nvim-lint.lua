return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"
      lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }

      lint.linters_by_ft = {
        markdown = { "vale" },
        htmldjangp = { "curlylint" },
        gitcommit = { "codespell" },
        dockerfile = { "hadolint" },
        python = { "flake8" },
        go = { "golangcilint" },
        yaml = { "yamllint" },
        json = { "jsonlint" },
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
      vim.keymap.set("n", "<leader>cf", function()
        require("lint").try_lint "cfn_lint"
      end, { desc = "Run AWS CloudFormation Linter" })
    end,
  },
}

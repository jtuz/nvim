return {
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_fallback = true, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        -- Conform will run multiple formatters sequentially
        python = { "black", "isort" },
        -- Use a sub-list to run only the first available formatter
        -- javascript = { { "prettierd", "prettier" } },
        go = { "gofmt", "goimports", "golines" },
        json = { "jq" },
        yaml = { "yamlfmt" },
      },
      formatters = {
        black = {
          prepend_args = { "--fast" },
        },
        golines = {
          prepend_args = { "--max-len=110" },
        },
      },
    },
    event = "BufWritePre",
    -- event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}

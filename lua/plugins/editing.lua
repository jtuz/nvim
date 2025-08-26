return {
  {
    "tommcdo/vim-exchange",
    event = "VeryLazy",
  },
  {
    "matze/vim-move",
    event = "VeryLazy",
  },
  {
    "godlygeek/tabular",
    event = "VeryLazy",
  },
  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}

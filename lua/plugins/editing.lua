return {
  {
    "tommcdo/vim-exchange",
    lazy = false,
  },
  {
    "matze/vim-move",
    lazy = false,
  },
  {
    "godlygeek/tabular",
    lazy = false,
  },
  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}

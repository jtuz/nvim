return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        enabled = false,
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
        config = function()
          require "configs.none-ls"
        end,
      },
      {
        "simrat39/symbols-outline.nvim",
        config = function()
          require("symbols-outline").setup {
            show_numbers = true,
            show_relative_numbers = true,
          }
        vim.keymap.set("n", "<leader>so", "<cmd> SymbolsOutline<CR>", { desc = "Symbols Outline" })
        end,
      },
      {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = "LspAttach",
        opts = {
          create_autocmd = false,
          -- configurations go here
          show_dirname = false,
          show_basename = false,
          attach_navic = false,
          kinds = {
            File = "󰈙 ",
            Module = " ",
            Namespace = "󰌗 ",
            Package = " ",
            Class = "󰌗 ",
            Method = " ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = "󰊕 ",
            Variable = " ",
            Constant = "󰏿 ",
            String = "󰀬 ",
            Number = " ",
            Boolean = "◩ ",
            Array = " ",
            Object = " ",
            Key = "󰌋 ",
            Null = "󰟢 ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = "󰆕 ",
            TypeParameter = " ",
            Macro = "󰉨 ",
          },
        },
        dependencies = {
          "SmiteshP/nvim-navic",
          config = function()
            require("nvim-navic").setup()
          end,
        },
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
}

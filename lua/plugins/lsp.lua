return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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

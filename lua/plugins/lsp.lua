local icons = require "nvchad.icons.lspkind"

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "b0o/schemastore.nvim", -- used for yamlls & jsonls
        lazy = false,
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
            File = icons.File,
            Module = icons.Module,
            Namespace = icons.Namespace,
            Package = icons.Package,
            Class = icons.Class,
            Method = icons.Method,
            Property = icons.Property,
            Field = icons.Field,
            Constructor = icons.Constructor,
            Enum = icons.Enum,
            Interface = icons.Interface,
            Function = icons.Function,
            Variable = icons.Variable,
            Constant = icons.Constant,
            String = icons.String,
            Number = icons.Number,
            Boolean = icons.Boolean,
            Array = icons.Array,
            Object = icons.Object,
            Key = icons.Key,
            Null = icons.Null,
            EnumMember = icons.EnumMember,
            Struct = icons.Struct,
            Event = icons.Event,
            Operator = icons.Operator,
            TypeParameter = icons.TypeParameter,
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
      require "configs.lspconfig"
    end,
  },
}

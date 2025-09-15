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
        "SmiteshP/nvim-navic",
        event = "LspAttach",
        config = function()
        dofile(vim.g.base46_cache .. "navic")
          require("nvim-navic").setup {
            highlight = true,
            icons = {
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
            separator = "  ",
            format_text = function(text)
              return " " .. text
            end,
            -- lazy_update_context = true,
          }
        end,
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },
}

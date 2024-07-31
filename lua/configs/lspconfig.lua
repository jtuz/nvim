require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require "lspconfig"
local util = require 'lspconfig/util'

local function sif(config, server)
  if config.settings then
    return config.settings
  else
    return server.settings
  end
end

local function fif(config, server)
  if config.filetypes then
    return config.filetypes
  else
    return server.filetypes
  end
end

local servers = {
  pyright = {
    settings = {
      python = {
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "openFilesOnly",
          indexing = true,
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  bashls = {},
  jsonls = {},
  marksman = {},
  lemminx = {},
  html = {
    filetypes = { "html", "htmldjango" },
  },
  yamlls = {
    settings = {
      yaml = {
        customTags = {
          "!Base64 scalar",
          "!Cidr scalar",
          "!And sequence",
          "!Equals sequence",
          "!If sequence",
          "!Not sequence",
          "!Or sequence",
          "!Condition scalar",
          "!FindInMap sequence",
          "!GetAtt scalar",
          "!GetAtt sequence",
          "!GetAZs scalar",
          "!ImportValue scalar",
          "!Join sequence scalar",
          "!Select sequence",
          "!Split sequence",
          "!Sub",
          "!Sub sequence scalar",
          "!Transform mapping",
          "!Ref scalar",
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  lspconfig[server].setup({
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end
    end,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false,
      }),
    },
    -- root_dir = vim.loop.cwd
    root_dir = util.find_git_ancestor,
    flags = {
      debounce_text_changes = 150,
    },
    settings = sif(config, lspconfig[server]),
    filetypes = fif(config, lspconfig[server]),
  })
end

lspconfig.powershell_es.setup{
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
    bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/"
}

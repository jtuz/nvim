require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

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
  harper_ls = {
    filetypes = { "markdown" },
    settings = {
      ["harper-ls"] = {
        linters = {
          TodoHypen = false,
          SpellCheck = false,
          SentenceCapitalization = false,
        },
        isolateEnglish = true,
        markdown = {
          -- [ignores this part]()
          -- [[ also ignores my marksman links ]]
          IgnoreLinkTitle = true,
        },
      },
    },
  },
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
  bashls = {
    filetypes = { "sh", "zsh", "bash" },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  marksman = {},
  lemminx = {},
  html = {
    filetypes = { "html", "htmldjango" },
  },
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          -- You must disable built-in schemaStore support if you want to use
          -- this plugin and its advanced options like `ignore`.
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
        customTags = {
          "!And mapping",
          "!And scalar",
          "!And sequence",
          "!Base64 mapping",
          "!Base64 scalar",
          "!Base64 sequence",
          "!Cidr mapping",
          "!Cidr scalar",
          "!Cidr sequence",
          "!Condition scalar",
          "!Equals mapping",
          "!Equals scalar",
          "!Equals sequence",
          "!FindInMap mapping",
          "!FindInMap scalar",
          "!FindInMap sequence",
          "!GetAtt mapping",
          "!GetAtt scalar",
          "!GetAtt sequence",
          "!GetAZs mapping",
          "!GetAZs scalar",
          "!GetAZs sequence",
          "!If mapping",
          "!If scalar",
          "!If sequence",
          "!ImportValue mapping",
          "!ImportValue scalar",
          "!ImportValue sequence",
          "!Join mapping",
          "!Join scalar",
          "!Join sequence",
          "!Not mapping",
          "!Not scalar",
          "!Not sequence",
          "!Or mapping",
          "!Or scalar",
          "!Or sequence",
          "!Ref mapping",
          "!Ref scalar",
          "!Ref sequence",
          "!Select mapping",
          "!Select scalar",
          "!Select sequence",
          "!Split mapping",
          "!Split scalar",
          "!Split sequence",
          "!Sub mapping",
          "!Sub scalar",
          "!Sub sequence",
          "!Transform mapping",
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  lspconfig[server].setup {
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
        -- NOTE: check default settings for neovim 0.11
        -- vim.diagnostic.config({virtual_text=true})
        virtual_text = false,
        underline = false,
        signs = true,
        update_in_insert = false,
      }),
    },
    -- root_dir = vim.loop.cwd
    -- root_dir = util.find_git_ancestor,
    flags = {
      debounce_text_changes = 150,
    },
    settings = sif(config, lspconfig[server]),
    filetypes = fif(config, lspconfig[server]),
  }
end

lspconfig.powershell_es.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/",
}

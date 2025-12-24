require("nvchad.configs.lspconfig").defaults()

-- local util = require "lspconfig/util"
-- root_dir = util.find_git_ancestor,
local home_dir = os.getenv "HOME"

local x = vim.diagnostic.severity
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "", [x.HINT] = "󰌵" } },
  update_in_insert = false,
  float = {
    border = "single",
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, ev.buf)
      vim.opt_local.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  end,
})

-- Global settings
vim.lsp.config("*", { flags = { debounce_text_changes = 150 } })

local servers = {
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
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
  powershell_es = {
    bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/",
  },
  harper_ls = {
    filetypes = { "markdown", "gitcommit", "COMMIT_EDITMSG" },
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
        disablOrganizeImports = true,
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "openFilesOnly",
          indexing = true,
          typeCheckingMode = "standard",
          exclude = {
            "cassetes",
            "data",
            "docs",
            "infraestructure",
            "infra",
            "locale",
            "model_mommy",
            "scripts",
            "templates",
            "**/node_modules",
            "**/__pycache__",
            ".git",
          },
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        analyses = {
          completeUnimported = true,
          usePlaceholders = true,
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  bashls = {
    filetypes = { "sh", "zsh", "bash" },
  },
  html = {
    filetypes = { "html", "htmldjango" },
  },
  groovyls = {
    cmd = {
      "java",
      "-jar",
      home_dir .. "/.local/bin/groovy-language-server-all.jar",
    },
    filetypes = { "groovy" },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

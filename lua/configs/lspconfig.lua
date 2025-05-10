require("nvchad.configs.lspconfig").defaults()

-- local util = require "lspconfig/util"
-- root_dir = util.find_git_ancestor,

-- NOTE: keep an eye on https://neovim.io/doc/user/lsp.html#vim.lsp.handlers
-- handlers = {
--   ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     underline = false,
--     signs = true,
--     update_in_insert = false,
--   }),
-- },
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
  signs = true,
  update_in_insert = false,
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, ev.buf)
    end
  end,
})

-- Global settings
vim.lsp.config("*", { flags = { debounce_text_changes = 150 } })

-- Custom settings by language
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.lsp.enable "jsonls"

vim.lsp.config("yamlls", {
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
})
vim.lsp.enable "yamlls"

vim.lsp.config("powershell_es", {
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/",
})
vim.lsp.enable "powershell_es"

vim.lsp.config("harper_ls", {
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
})
vim.lsp.enable "harper_ls"

vim.lsp.config("pyright", {
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
})
vim.lsp.enable "pyright"

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable "gopls"

vim.lsp.config("bashls", {
  filetypes = { "sh", "zsh", "bash" },
})
vim.lsp.enable "bashls"

vim.lsp.config("html", {
  filetypes = { "html", "htmldjango" },
})

vim.lsp.enable "html"

vim.lsp.enable {
  "marksman",
  "lemminx",
}

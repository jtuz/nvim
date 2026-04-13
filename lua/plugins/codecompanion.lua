return {
  "olimorris/codecompanion.nvim",
  version = "^19.9.0",
  cmd = {
    "CodeCompanionChat",
    "CodeCompanion",
    "CodeCompanionCLI",
    "CodeCompanionCmd",
    "CodeCompanionActions",
  },
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  opts = {
    display = {
      chat = {
        icons = {
          chat_context = "📎️",
        },
        fold_context = true,
      },
    },
    adapters = {
      acp = {
        opencode = function()
          return require("codecompanion.adapters").extend("opencode", {
            defaults = {
              mcpServers = "inherit_from_config",
            },
          })
        end,
        kiro = function()
          return require("codecompanion.adapters").extend("kiro", {
            mcpServers = "inherit_from_config",
          })
        end,
        copilot_acp = function()
          return require("codecompanion.adapters").extend("copilot_acp", {
            mcpServers = "inherit_from_config",
          })
        end,
      },
    },
    interactions = {
      cli = {
        agent = "opencode",
        agents = {
          opencode = {
            cmd = "opencode",
            args = {},
            description = "Opencode CLI",
            provider = "nvterm",
          },
          kiro = {
            cmd = "kiro-cli",
            args = {},
            description = "AWS Kiro",
            provider = "terminal",
          },
        },
      },
    },
    extensions = {
      mcphub = {
        callback = function()
          return require "mcphub.extensions.codecompanion"
        end,
        opts = {
          -- MCP Tools
          make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true, -- Show tool results directly in chat buffer
          format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          -- TODO: a fix is comming in next releases of mcphub, set this variable to true
          make_vars = false, -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true, -- Add MCP prompts as /slash commands
        },
      },
    },
  },
}

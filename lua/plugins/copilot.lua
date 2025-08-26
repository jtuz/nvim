return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatPrompts",
      "CopilotChatModels",
      "CopilotChatAgents",
    },
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        opts = {
          suggestion = {
            enabled = false,
          },
          filetypes = {
            ["*"] = false,
          },
        }
      },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        title = '🤖 AI Assistant',
      },
      headers = {
        user = "  You: ",
        assistant = "  Copilot: ",
        tool = "🔧 Tool: ",
      }
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

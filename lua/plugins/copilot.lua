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
        layout = 'float',
        -- width = 80, -- Fixed width in columns
        -- height = 20, -- Fixed height in rows
        width = math.floor(vim.o.columns * 0.7), -- 70% of terminal width
        height = math.floor(vim.o.lines * 0.6),  -- 60% of terminal height
        border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
        zindex = 100, -- Ensure window stays on top
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

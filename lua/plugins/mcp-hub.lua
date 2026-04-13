return {
  "ravitemer/mcphub.nvim",
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  cmd = { "MCPHub" },
  opts = {}
}

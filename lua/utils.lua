local M = {}

M.path_separator = package.config:sub(1, 1)

M.OSX = function()
  return vim.loop.os_uname().sysname == "Darwin"
end

M.LINUX = function()
  return vim.loop.os_uname().sysname == "Linux"
end

M.WINDOWS = function ()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

return M

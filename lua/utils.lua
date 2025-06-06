local M = {}

M.path_separator = package.config:sub(1, 1)

-- Cache system name to avoid repeated system calls
local sysname = vim.loop.os_uname().sysname

-- OS checks as booleans for performance and simplicity
M.OSX = sysname == "Darwin"
M.LINUX = sysname == "Linux"
M.WINDOWS = sysname == "Windows_NT"

return M

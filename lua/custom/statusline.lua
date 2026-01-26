local utils = require "nvchad.stl.utils"
local op_sys = require "utils"

local sep_style = "block"
local default_sep_icons = {
  default = { left = "", right = " " },
  round = { left = "", right = "" },
  block = { left = "█", right = " " },
  -- block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local platform = function()
  local os_icon = ""
  if op_sys.LINUX then
    os_icon = ""
  elseif op_sys.OSX then
    os_icon = ""
  elseif op_sys.WINDOWS then
    os_icon = ""
  end

  return "%#St_cwd_text#" .. os_icon
end

local lang_translation = function()
  local spell = vim.api.nvim_get_option_value("spell", {})
  local spelllang = vim.api.nvim_get_option_value("spelllang", {})

  if not spell then
    return ""
  end
  return "%#St_Lsp#" .. " 󰓆" .. spelllang .. " " .. "%#St_file_sep#"
end

local get_venv = function(arg)
  local venv = os.getenv(arg)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch "([^/]+)" do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

local M = {}

M.modules = {
  file_info = function()
    local x = utils.file()
    local name = " " .. x[2] .. " "
    return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r .. lang_translation()
  end,

  custom_cwd = function()
    local icon = "%#St_cwd_icon#" .. "󰉋 "
    local name = "%#St_cwd_text#" .. " " .. vim.uv.cwd():match ".+/(.-)$" .. " "
    local cwd = (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. icon .. name)) or ""

    return cwd .. "󰇝 " .. platform() .. " "
  end,

  cursor_position = function()
    local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
    local text = vim.o.columns > 140 and "%l:%c" or ""

    return left_sep .. "%#St_Pos_txt# " .. text .. " "
  end,

  python_venv = function()
    if vim.bo.filetype ~= "python" then
      return " "
    end

    local venv = get_venv "CONDA_DEFAULT_ENV" or get_venv "VIRTUAL_ENV" or " "
    if venv == " " then
      return " "
    else
      return "  " .. venv
    end
  end,
}

return M

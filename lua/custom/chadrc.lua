---@type ChadrcConfig
local M = {}

--require("base46").toggle_transparency()

M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

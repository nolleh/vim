local M = {}

M.plugins = "custom.plugins"

M.ui = {
  theme = "Catppuccin",
  hl_override = {
    Visual = {
      fg = {"black", 0},
      bg = {"green", 10},
    },
    CursorLine = {
      bg = "#2f2e3e"
    },
  }
}

M.mappings = require("custom.mappings")

return M

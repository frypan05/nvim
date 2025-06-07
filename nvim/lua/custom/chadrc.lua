---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"

M.ui = {
  theme = 'chadracula',
  transparency = true,
  nvimtree = {
        git = {
            enable = true, -- Show Git status in the file tree
        },
        view = {
            width = 40, -- Set width of the file tree
        },
    },
}
return M

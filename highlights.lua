-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  -- Visual = {
  --   bg = "light_grey",
  --   fg = "white",
  -- },
  --
  -- Comment = {
  --   fg = "light_grey",
  --   italic = true,
  -- },
  --
  -- LineNr = {
  --   fg = "blue",
  -- },
  --
  -- CursorLineNr = {
  --   fg = "white",
  -- },
  --
  --
  -- WinSeparator = {
  --   fg = "white",
  -- },
}

---@type HLTable
M.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M

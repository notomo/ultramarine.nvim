local M = {}

local p = {
  black = "#111133",
  white = "#eeeeff",
  dark_gray = "#6666aa",
  gray = "#8888bb",
  light_gray = "#bbbbbb",

  dark_blue = "#06317f",
  blue = "#042461",
  light_blue = "#3362b8",
  lightest_blue = "#afd9da",

  red = "#f47f90",
  orange = "#ff7e5f",

  dark_yellow = "#8a571a",
  yellow = "#f2bf80",

  dark_green = "#0a5a8f",
  green = "#38807a",
  light_green = "#7bd4cc",

  pink = "#b35212",
  magenta = "#ff8aff",
}
M.pallet = p

local highlight_groups = {
  CurSearch = { fg = p.white, bg = p.pink, bold = true },
  IncSearch = { fg = p.white, bg = p.pink, bold = true },
  Search = { fg = p.black, bg = p.light_green, bold = true },

  Cursor = { bg = p.white },
  lCursor = { bg = p.white },
  CursorColumn = { bg = p.dark_blue },
  CursorLine = { bg = p.dark_blue },
  TermCursor = { reverse = true },

  DiffAdd = { bg = p.green, bold = true },
  DiffChange = { bg = p.dark_yellow, bold = true },
  DiffDelete = { bg = p.pink },
  DiffText = { bold = true },

  Normal = { fg = p.white, bg = p.blue },
  NormalFloat = { bg = p.black },
  FloatBorder = { bg = p.black },
  WinSeparator = { fg = p.light_blue, bg = p.blue },
  WinBar = { bg = p.light_blue, bold = true },
  WinBarNC = { bg = p.light_blue, bold = true },
  WildMenu = { fg = p.black, bg = p.lightest_blue, bold = true },
  MsgArea = { bg = p.blue },

  LineNr = { fg = p.dark_gray },
  CursorLineNr = { fg = p.yellow, bg = p.light_blue, bold = true },
  SignColumn = { bg = p.blue },

  Folded = { fg = p.white, bg = p.dark_gray },
  FoldColumn = { bg = p.blue },

  NonText = { fg = p.dark_gray },
  SpecialKey = { fg = p.gray },

  Title = { fg = p.yellow, bold = true },
  Question = { fg = p.yellow, bold = true },
  ModeMsg = { fg = p.yellow, bold = true },
  MoreMsg = { fg = p.light_green, bold = true },
  WarningMsg = { fg = p.red },
  ErrorMsg = { fg = p.red, bold = true },

  Pmenu = { bg = p.black },
  PmenuMatch = { fg = p.yellow, bold = true },
  PmenuMatchSel = { fg = p.yellow, bg = p.light_blue, bold = true },
  PmenuSel = { bg = p.light_blue, bold = true },
  PmenuSbar = { bg = p.gray },
  PmenuThumb = { bg = p.yellow },

  SpellBad = { fg = p.red },
  SpellCap = { fg = p.red },
  SpellLocal = { fg = p.red },
  SpellRare = { fg = p.red },

  StatusLine = { bg = p.light_blue, bold = true },
  StatusLineNC = { bg = p.dark_blue },

  TabLine = { fg = p.light_gray, bg = p.blue },
  TabLineFill = { bg = p.blue },
  TabLineSel = { fg = p.yellow, bg = p.dark_blue, bold = true },

  ColorColumn = { bg = p.gray },

  Conceal = { bg = p.gray },

  Directory = { fg = p.light_green },

  MatchParen = { bg = p.yellow },

  Visual = { bg = p.dark_green },

  Comment = { fg = p.gray },
  Constant = { fg = p.red },
  String = { fg = p.light_green },
  Character = { fg = p.light_green },
  Number = { fg = p.red },
  Boolean = { fg = p.red },
  Float = { fg = p.red },
  Identifier = { fg = p.yellow },
  Function = { fg = p.orange },
  Statement = { fg = p.lightest_blue, bold = true },
  Conditional = { fg = p.lightest_blue },
  Label = { fg = p.yellow },
  Keyword = { fg = p.yellow, bold = true },
  PreProc = { fg = p.orange },
  Define = { fg = p.orange },
  Type = { fg = p.yellow, bold = true },
  StorageClass = { fg = p.orange },
  Special = { fg = p.yellow, bold = true },
  Tag = { fg = p.orange },
  SpecialComment = { fg = p.orange },
  Underlined = { fg = p.lightest_blue, underline = true },
  Error = { fg = p.red, bold = true },
  Todo = { fg = p.black, bg = p.red, bold = true },
}
M.highlight_groups = highlight_groups

local terminal_colors = {
  terminal_color_0 = p.light_gray,
  terminal_color_1 = p.red,
  terminal_color_2 = p.light_green,
  terminal_color_3 = p.yellow,
  terminal_color_4 = p.lightest_blue,
  terminal_color_5 = p.magenta,
  terminal_color_6 = p.lightest_blue,
  terminal_color_7 = p.white,
  terminal_color_8 = p.light_gray,
  terminal_color_9 = p.orange,
  terminal_color_10 = p.light_green,
  terminal_color_11 = p.yellow,
  terminal_color_12 = p.lightest_blue,
  terminal_color_13 = p.magenta,
  terminal_color_14 = p.lightest_blue,
  terminal_color_15 = p.white,
}
M.terminal_colors = terminal_colors

local nvim_set_hl = vim.api.nvim_set_hl
local g = vim.g

function M.enable()
  if vim.o.background ~= "dark" then
    vim.o.background = "dark"
  end
  if g.colors_name then
    vim.cmd.highlight("clear")
  end
  if g.syntax_on then
    vim.cmd.syntax("reset")
  end

  g.colors_name = "ultramarine"

  for group, definition in pairs(highlight_groups) do
    nvim_set_hl(0, group, definition)
  end
  for name, color in pairs(terminal_colors) do
    g[name] = color
  end
end

return M

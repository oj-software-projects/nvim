-- lua/plugins/colors.lua
local M = {}

-- Liste der verfügbaren Themes
M.themes = {
  'everforest',
  'tokyonight',
  'catppuccin',
  'gruvbox-material',
  'kanagawa',
  'sonokai',
  'tokyodark',
  'nightfox',
  'oceanic-next',
  'dracula',
  'nord',
  'rose-pine',
}

-- Pfad zur Cache-Datei für das zuletzt verwendete Theme
local cache_file = vim.fn.stdpath('cache') .. '/last_theme'

-- Liest den Index des zuletzt verwendeten Themes
local function read_last_index()
  local f = io.open(cache_file, 'r')
  if f then
    local last = f:read("*l")
    f:close()
    for i, name in ipairs(M.themes) do
      if name == last then
        return i
      end
    end
  end
  return 1
end

-- Speichert das zuletzt verwendete Theme
local function write_last(theme)
  local f = io.open(cache_file, 'w')
  if f then
    f:write(theme)
    f:close()
  end
end

-- Aktueller Index (aus Cache oder default)
M.idx = read_last_index()

-- Setzt ein Theme anhand des Namens
function M.apply(theme)
  -- Theme-spezifische Einstellungen
  if theme == 'nord' then
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
  elseif theme == 'catppuccin' then
    require('catppuccin').setup({ flavour = 'mocha', transparent_background = true })
  elseif theme == 'rose-pine' then
    require('rose-pine').setup({ dark_variant = 'moon', disable_background = true })
  elseif theme == 'tokyonight' then
    require('tokyonight').setup({ style = 'storm', transparent = true })
  elseif theme == 'kanagawa' then
    require('kanagawa').setup({ undercurl = true, commentStyle = { italic = true } })
  end

  -- Farben setzen und Cache updaten
  vim.cmd('colorscheme ' .. theme)
  write_last(theme)
end

-- Zyklisches Umschalten
function M.cycle()
  M.idx = (M.idx % #M.themes) + 1
  M.apply(M.themes[M.idx])
end

-- Beim Start das gespeicherte (oder erste) Theme setzen
M.apply(M.themes[M.idx])

-- Keymap zum Umschalten
vim.keymap.set('n', '<leader>ct', M.cycle, { desc = 'Cycle color scheme', noremap = true, silent = true })

return M


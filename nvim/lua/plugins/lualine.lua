require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_x = {'g:metals_status', 'encoding', 'fileformat', 'filetype'},
  }
}

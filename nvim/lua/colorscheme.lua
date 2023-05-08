-- require("catppuccin").setup({
--   flavour = "machiatto",
--   background = { -- :h background
--       light = "latte",
--       dark = "macchiato",
--   },
-- })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
})

vim.cmd [[colorscheme tokyonight]]

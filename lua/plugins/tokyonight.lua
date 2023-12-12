return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      style = "night",
      -- The theme is used when the background is set to light
      light_style = "day",
      -- Enable this to disable setting the background color
      transparent = false,
      -- Configure the colors used when opening a `:terminal` in 
      -- [Neovim](https://github.com/neovim/neovim)
      terminal_colors = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      -- Set a darker background on sidebar-like windows. 
      -- For example: `["qf", "vista_kind", "terminal", "packer"]`
      sidebars = { "vista_kind", "help" },
      -- Adjusts the brightness of the colors of the **Day** style. 
      -- Number between 0 and 1, from dull to vibrant colors
      day_brightness = 0.3,
      -- Enabling this option, will hide inactive statuslines and 
      -- replace them with a thin border instead. 
      -- Should work with the standard **StatusLine** and **LuaLine**.
      hide_inactive_statusline = false,
      -- dims inactive windows
      dim_inactive = false,
      -- When `true`, section headers in the lualine theme will be bold
      lualine_bold = false,
    })
  end,
}

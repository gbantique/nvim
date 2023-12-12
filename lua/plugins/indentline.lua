return {
  "lukas-reineke/indent-blankline.nvim",
  --main = "ibl",
  config = function()
    require("ibl").setup {
      scope = {
        show_start = true,
        show_end = true,
      },
      indent = {
        char = "▏",
      }
    }
  end,
}



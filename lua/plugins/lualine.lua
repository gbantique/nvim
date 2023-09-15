return {
  "nvim-lualine/lualine.nvim", -- status line
  config = function()
    local lualine = require("lualine")

    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.buf_get_clients(bufnr)
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return "  " .. table.concat(c, ", ") .. " "
    end

    local config = {
      options = {
        icons_enabled = true,
        component_separators = "",
        section_separators = "",
        --[[ component_separators = { left = "", right = "" }, ]]
        --[[ section_separators = { left = "", right = "" }, ]]
        disabled_filetypes = {
          statusline = {},
          winbar = {},
          "NvimTree",
          "alpha",
          "dashboard",
          "Outline"
        },
        always_divide_middle = true,
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", clients_lsp },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {},
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end
}

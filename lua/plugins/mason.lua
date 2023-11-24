return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()

    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local lsp_servers = require("utils.lsp-servers")

    mason.setup({
      PATH = "prepend", -- "skip" seems to cause the spawning error
    })

    mason_lspconfig.setup({
      ensure_installed = lsp_servers.all_servers, -- will be installed by mason
      automatic_installation = false
    })
  end
}

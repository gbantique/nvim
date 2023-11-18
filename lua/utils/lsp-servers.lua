local M = {}

M.all_servers = {
  -- "jsonls",
  --[[ "lua_ls", ]]
  --[[ "clangd", ]]
  --[[ "prosemd_lsp", ]]
  "cssls",
  --[[ "rust_analyzer", ]]
  "vuels",
  "tsserver",
  --[[ "texlab", ]]
  "angularls",
  "eslint",
  --[[ "emmet-ls", ]]
  "cmake"
}

M.regular_servers = {
  --[[ "prosemd_lsp", ]]
  --[[ "cssls", ]]
  "vuels",
  "tsserver",
  --[[ "texlab", ]]
  "angularls",
  "eslint",
  --[[ "emmet-ls", ]]
  "cmake"
}

return M

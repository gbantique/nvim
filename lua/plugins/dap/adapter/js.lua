-- Configure Javascript Debugger
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
  adapters = {
    "chrome",
    "pwa-node",
    "pwa-chrome",
    "pwa-msedge",
    "node-terminal",
    "pwa-extensionHost"
  },
})

for _, language in ipairs({
  "typescript",
  "javascript",
  "svelte",
  "typescriptreact",
  "javascriptreact",
  "vue", }) do
  require("dap").configurations[language] = {
    --[[ -- only if language is javascript, offer this debug action
    language == "javascript" and {
      -- use nvim-dap-vscode-js's pwa-node debug adapter
      type = "pwa-node",
      -- launch a new process to attach the debugger to
      request = "launch",
      -- name of the debug action you have to select for this config
      name = "Launch file in new node process",
      -- launch current file
      program = "${file}",
      cwd = "${workspaceFolder}",
    } or nil, ]]
    language == "javascript" and
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    } or nil,
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach debugger to existing `node --inspect` process",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(), -- "${workspaceForlder}/src"
      sourceMaps = true,
      -- resolve source maps in nested locations while ignoring node_modules
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**" },
      skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
    },
    -- Debug web applications (client side)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome to debug client",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = vim.fn.getcwd(), --"${workspace}/src"
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
      --skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
    },
    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end



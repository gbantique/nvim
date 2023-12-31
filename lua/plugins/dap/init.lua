return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    -- build debugger from source
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && rm -rf out && mv dist out"
    },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },
  --[[ keys = {
    -- normal mode is default
    { "<leader>d", function() require "dap".toggle_breakpoint() end },
    { "<leader>c", function() require "dap".continue() end },
    { "<C-p>",     function() require "dap".step_over() end },
    { "<C-i>",     function() require "dap".step_into() end },
    { "<C-o>",     function() require "dap".step_out() end },
  }, ]]
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text_status = require("nvim-dap-virtual-text")

    dap_virtual_text_status.setup({
      -- enable this plugin (the default)
      enabled = true,
      -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, 
      -- (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      enabled_commands = true,
      -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_changed_variables = true,
      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      highlight_new_as_changed = false,
      -- show stop reason when stopped for exceptions
      show_stop_reason = true,
      -- prefix virtual text with comment string
      commented = true,
      -- only show virtual text at first definition (if there are multiple)
      only_first_definition = true,
      all_references = false, -- show virtual text on all all references of the variable (not only definitions)
      -- filter references (not definitions) pattern when all_references is activated 
      -- (Lua gmatch pattern, default filters out Python modules)
      filter_references_pattern = "<module",

      -- experimental features:
      -- position of virtual text, see `:h nvim_buf_set_extmark()`
      virt_text_pos = "eol",
      -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      all_frames = false,
      -- show virtual lines instead of virtual text (will flicker!)
      virt_lines = false,
      -- position the virtual text at a fixed window column (starting from the first text column) ,
      virt_text_win_col = nil
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    })


    -- setup js adapter
    require("plugins.dap.adapter.js")

    --[[ require("dapui").setup() ]]
    dapui.setup({
      --[[  layouts = {
        {
          --elements = {
          --  "watches",
          --},
          size = 0.2,
          position = "left",
        },
      }, ]]
      controls = {
        enabled = true,
      },
      render = {
        max_value_lines = 3,
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    })


    local icons = require("config.icons")
    vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })

    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.BigCircle,
      texthl = "DapBreakpoint", linehl = "", numhl = "" })

    vim.fn.sign_define("DapBreakpointCondition", { text = icons.ui.CircleWithGap,
      texthl = "DapBreakpointCondition", linehl = "", numhl = "" })

    vim.fn.sign_define("DapLogPoint", { text = icons.ui.LogPoint, texthl = "DapLogPoint",
      linehl = "", numhl = "" })

    vim.fn.sign_define("DapStopped", { text = icons.ui.ChevronRight, texthl = "Error",
      linehl = "DapStoppedLinehl", numhl = "" })

    vim.fn.sign_define("DapBreakpointRejected", { text = icons.diagnostics.Error,
      texthl = "Error", linehl = "", numhl = "" })


    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end
}


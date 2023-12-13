return {
  "folke/which-key.nvim", -- vim which key
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local which_key = require("which-key")

    which_key.setup({
      --plugins = {
      --  spelling = false
      --},
      --window = {
      --  border = "single"
      --}
      plugins = {
        -- shows a list of your marks on ' and `
        marks = true,
        -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        registers = true,
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          enabled = true,
          -- how many suggestions should be shown in the list?
          suggestions = 20,
        },
        presets = {
          -- adds help for operators like d, y, ...
          operators = true,
          -- adds help for motions
          motions = true,
          -- help for text objects triggered after entering an operator
          text_objects = true,
          -- default bindings on <c-w>
          windows = true,
          -- misc bindings to work with windows
          nav = true,
          -- bindings for folds, spelling and others prefixed with z
          z = true,
          -- bindings for prefixed with g
          g = true,
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      motions = {
        count = true,
      },
      icons = {
        -- symbol used in the command line area that shows your active key combo
        breadcrumb = "»",
        -- symbol used between a key and it's label
        separator = "➜",
        -- symbol prepended to a group
        group = "+",
      },
      popup_mappings = {
        -- binding to scroll down inside the popup
        scroll_down = "<c-j>",
        -- binding to scroll up inside the popup
        scroll_up = "<c-k>",
      },
      window = {
        -- none, single, double, shadow
        border = "single",
        -- bottom, top
        position = "bottom",
        -- extra window margin [top, right, bottom, left].
        -- When between 0 and 1, will be treated as a percentage of the screen size.
        margin = { 1, 1, 1, 1 },
        -- extra window padding [top, right, bottom, left]
        padding = { 1, 2, 1, 2 },
        -- value between 0-100 0 for fully opaque and 100 for fully transparent
        winblend = 10,
        -- positive value to position WhichKey above other floating windows.
        zindex = 1000,
      },
      layout = {
        -- min and max height of the columns
        height = { min = 4, max = 25 },
        -- min and max width of the columns
        width = { min = 20, max = 50 },
        -- spacing between columns
        spacing = 3,
        -- align columns left, center or right
        align = "left",
      },
      -- enable this to hide mappings for which you didn't specify a label
      ignore_missing = false,
      -- hide mapping boilerplate
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
      -- show a help message in the command line for using WhichKey
      show_help = true,
      -- show the currently pressed key and its label as a message in the command line
      show_keys = true,
      -- automatically setup triggers
      triggers = "auto",
      -- triggers = {"<leader>"} -- or specifiy a list manually
      -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
      },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = { "NvimTree" },
      },
    })
    which_key.register({
      mode = { "n" },
      ["<leader>b"] = { name = "+buffers" },
      ["<leader>c"] = { name = "+cmake" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>f"] = { name = "+find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>h"] = { name = "+hop" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>m"] = { name = "+markdown" },
      ["<leader>r"] = { name = "+code_runner" },
      ["<leader>t"] = { name = "+terminal" },
    })
  end
}


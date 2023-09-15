return {
  "goolord/alpha-nvim", -- A fast and fully customizable greeter for neovim
  config = function()
    local alpha = require("alpha")

    local is_unix = vim.fn.has("unix") == 1
    local is_win32 = vim.fn.has("win32") == 1
    local configure_path
    if is_unix then
      configure_path = "~/.config/nvim/init.lua"
    elseif is_win32 then
      configure_path = "~/AppData/Local/nvim/init.lua"
    end

    local dashboard = require("alpha.themes.dashboard")

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl = "Function"
      b.opts.hl_shortcut = "Identifier"
      return b
    end

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }
    dashboard.section.buttons.val = {
      button("f", "  Find file", ":Telescope find_files <CR>"),
      button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      button("p", "  Find project", ":Telescope projects <CR>"),
      button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      button("q", "  Quit Neovim", ":qa<CR>"),
    }
    dashboard.section.footer.val = {
      [[                          ]],
      [[                          ]],
      [[  George Bantique © 2023  ]],
      [[       Web Developer      ]],
      [[                          ]],
      [[                          ]],
    }

    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Include"
    dashboard.section.footer.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end
}

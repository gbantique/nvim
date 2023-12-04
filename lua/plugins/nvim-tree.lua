return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")
    local icons = require("config.icons")

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true
        }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    end

    nvim_tree.setup({
      on_attach = my_on_attach,
      sort_by = "case_sensitive",
      auto_reload_on_write = true,
      disable_netrw = true,
      open_on_tab = false,
      update_cwd = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_directories = {
        enable = false,
      },
      git = {
        ignore = false,
      },
      filters = {
        -- custom = { ".git" },
        exclude = { ".gitignore", ".env" },
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      view = {
        width = 32,
        side = "left",
        number = false,
        relativenumber = false,
        preserve_window_proportions = true,
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true
          },
          webdev_colors = true,
          git_placement = "after",
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "◉",
            git = {
              unstaged = icons.git.Mod,
              staged = icons.git.Add,
              unmerged = icons.git.Unmerged,
              renamed = icons.git.Rename,
              deleted = icons.git.Remove,
              untracked = icons.git.Untrack,
              ignored = icons.git.Diff,
            },
            folder = {
              arrow_open = icons.ui.ArrowOpen,
              arrow_closed = icons.ui.ArrowClosed,
              default = icons.documents.Folder,
              open = icons.documents.OpenFolder,
              empty = icons.documents.EmptyFolder,
              empty_open = icons.documents.EmptyOpenFolder,
              symlink = icons.documents.FolderSymlink,
            },
          },
        },
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.Hint,
          info = icons.diagnostics.Information,
          warning = icons.diagnostics.Warning,
          error = icons.diagnostics.Error,
        },
      },
    })
  end,
}


return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    require "nvim-treesitter.install".compilers = { "clang" }

    configs.setup {
      -- A list of parser names, or "all"
      ensure_installed = {
        "c",
        "lua",
        "cpp",
        "bash",
        "bibtex",
        "clojure",
        "css",
        "gitignore",
        "gitcommit",
        "git_rebase",
        "gitattributes",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "scss",
        "scheme",
        "sql",
        "toml",
        "typescript",
        "yaml",
        "rust",
        "vue",
      },
      auto_install = false,
      sync_install = false,                  -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "hack", "rnoweb" }, -- List of parsers to ignore installing
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      --[[ context_commentstring = {
        enable = true,
        enable_autocmd = false,
      }, ]]

    }
  end
}

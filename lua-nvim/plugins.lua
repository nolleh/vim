local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- A list of parser names or "all"
      ensure_installed = {
        "bash",
        "css",
        "scss",
        "json",
        "html",
        "svelte",
        "javascript",
        "typescript",
        "python",
        "vim",
        "vimdoc",
        "regex",
        "sql",
        "prisma",
        "go",
        "gomod",
        "gosum",
        "yaml",
        "glimmer",
        "c",
        "cpp",
        "cmake",
        "proto",
        "kotlin",
        "mermaid",
        "markdown",
        "markdown_inline"
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      renderer = {
        highlight_git = true,
      },
      view = {
        width = {
          max = 40,
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nolleh/null-ls.nvim",
      config = function()
        require("custom.configs.null-ls")
      end,
    },

    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codespell",
        "yaml-language-server",
        "omnisharp",
        "glow",

        -- lua stuff
        "bash-language-server",
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "svelte-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "json-lsp",
        "prettier",
        "kotlin-language-server",
        "ktlint",

        -- shell
        "shfmt",
        "shellcheck",
        --
        "pyright",
        "black",
        "gopls",
        "helm-ls",

        -- c++
        "cmake-language-server",
        "gersemi",
        "cpplint",
        "clang-format",
        "buf",
      },
    },
  },

  {
    "nolleh/jaq-nvim",
    cmd = { "Jaq" },
    config = function()
      require("custom.configs.jaq-nvim")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("custom.configs.lsp-saga")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",     -- optional
    },
  },
  { "vimwiki/vimwiki",       lazy = false },
  { "NLKNguyen/pipe.vim",    cmd = { "PipeUse", "PipeToFile" } },
  { "nolleh/pipe-mysql.vim", ft = { "sql", "mysql" },          dependencies = { "NLKNguyen/pipe.vim" } },
  { "wfxr/minimap.vim",      cmd = { "MinimapToggle" } },
  -- ["chrisbra/Colorizer"] = {},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },
  { "mtdl9/vim-log-highlighting", ft = { "log" } },
  { "github/copilot.vim",         event = { "BufReadPre", "BufNewFile" } },
}

return plugins

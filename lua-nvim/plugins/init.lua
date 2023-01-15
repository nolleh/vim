return {
  ["nvim-tree/nvim-tree-lua"] = {
    override_options = {
      renderer = {
        highlight_git = true
      }
    }
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
        --
        "python-lsp-server",
      },
    },
  },

  --["jose-elias-alvarez/null-ls.nvim"] = {
  --  after = "nvim-lspconfig",
  --  config = function()
  --     require "custom.plugins.null-ls"
  --  end,
  --},

  ["thinca/vim-quickrun"] = {},
  ["is0n/jaq-nvim"] = {},
  ["vimwiki/vimwiki"] = {},
  ["NLKNguyen/pipe.vim"] = {},
  ["NLKNguyen/pipe-mysql.vim"] = {},
  --  {{ do yarn install
  ["prettier/vim-prettier"] = {},
  ["iamcco/markdown-preview.nvim"] = {},
  -- }}
}

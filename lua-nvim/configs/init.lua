-- return {}
return {
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yaml-language-server",
        "omnisharp",
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "svelte-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
        --
        "pyright",
        "black",
        "gopls",
      },
    },
  },

  { "vimwiki/vimwiki", lazy = false },
  { "NLKNguyen/pipe.vim", cmd = { "PipeUse", "PipeToFile" } },
  { "nolleh/pipe-mysql.vim", ft = { "sql", "mysql" }, dependencies = { "NLKNguyen/pipe.vim" } },
  { "wfxr/minimap.vim", cmd = { "MinimapToggle" } },
  -- ["chrisbra/Colorizer"] = {},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },
}

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

  { "vimwiki/vimwiki", event = { "BufReadPre", "BufNewFile" } },
  { "NLKNguyen/pipe.vim", cmd = { "PipeUse", "PipeToFile" } },
  { "nolleh/pipe-mysql.vim", event = { "BufReadPre", "BufNewFile" } },
  { "wfxr/minimap.vim", cmd = { "MinimapToggle" } },
  -- ["chrisbra/Colorizer"] = {},
  -- {{ do yarn install
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- }}
}

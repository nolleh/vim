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
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "yamlls",
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
                    "gopls",
                },
            })
        end,
    },

    { "vimwiki/vimwiki", event = { "BufReadPre", "BufNewFile" } },
    { "NLKNguyen/pipe.vim", cmd = { "PipeUse", "PipeToFile" } },
    { "nolleh/pipe-mysql.vim", event = { "BufReadPre", "BufNewFile" } },
    { "wfxr/minimap.vim", cmd = { "MinimapToggle" } },
    -- ["chrisbra/Colorizer"] = {},
    -- {{ do yarn install
    { "iamcco/markdown-preview.nvim", cmd = { "MarkdownPreviewToggle" } },
    -- }}
}

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
		"nvim-treesitter/nvim-treesitter",
		configs = function()
			require("custom.configs.config")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
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

	{
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("custom.configs.null-ls")
		end,
	},

	{
		"nolleh/jaq-nvim",
		config = function()
			require("custom.configs.config")
		end,
	},
	{ "vimwiki/vimwiki" },
	{ "NLKNguyen/pipe.vim" },
	{ "nolleh/pipe-mysql.vim" },
	{ "wfxr/minimap.vim" },
	-- ["chrisbra/Colorizer"] = {},
	-- {{ do yarn install
	{ "iamcco/markdown-preview.nvim" },
	-- }}
}

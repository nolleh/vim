-- return {}
return {
	["nvim-tree/nvim-tree.lua"] = {
		override_options = {
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

	["nvim-treesitter/nvim-treesitter"] = {
		configs = function()
			require("custom.plugins.config")
		end,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
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
				"svelte-language-server",
				"typescript-language-server",
				"prisma-language-server",
				"deno",
				"json-lsp",

				-- shell
				"shfmt",
				"shellcheck",
				--
				"pyright",
			},
		},
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["nolleh/jaq-nvim"] = {
		config = function()
			require("custom.plugins.config")
		end,
	},
	["vimwiki/vimwiki"] = {},
	["NLKNguyen/pipe.vim"] = {},
	["NLKNguyen/pipe-mysql.vim"] = {},
	["wfxr/minimap.vim"] = {},
	-- ["chrisbra/Colorizer"] = {},
	-- {{ do yarn install
	["iamcco/markdown-preview.nvim"] = {},
	-- }}
}

return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = 'Mason',
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = " ",
						package_pending = " ",
						package_uninstalled = " ",
					},
				}
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		dependencies = {
			'williamboman/mason.nvim'
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require'lspconfig'.clangd.setup {
				cmd = {
					"clangd",
					"--compile-commands-dir=.",
					"--fallback-style=LLVM",
					"--clang-tidy",
					"--background-index",
					"--all-scopes-completion",
					"--header-insertion=never",
					"--pch-storage=memory",
				},
			}
			require'lspconfig'.pyright.setup{
			}
		end
	},
}

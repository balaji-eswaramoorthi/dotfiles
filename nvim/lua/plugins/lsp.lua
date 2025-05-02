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
			-- Optional: advertise cmp capabilities (keep this if you use nvim-cmp)
			local caps = nil
			pcall(function()
				caps = require("cmp_nvim_lsp").default_capabilities()
			end)

			-- clangd
			vim.lsp.config("clangd", {
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
				capabilities = caps,
				-- on_attach = function(client, bufnr) ... end,
			})

			-- pyright
			vim.lsp.config("pyright", {
				capabilities = caps,
				-- settings = { python = { analysis = { typeCheckingMode = "basic" } } },
			})

			-- finally enable (start) the servers
			vim.lsp.enable("clangd")
			vim.lsp.enable("pyright")
		end,
	},
}

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			enabled = false,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = "*",
		enabled = false,
		opts = {
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				"bash",
				"python",
				"rust",
				"diff",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"vimdoc",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {
				"javascript",
			},

			parser_install_dir = "$HOME/.local/share/treesitter",

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				-- disable = { "rust" },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 2000 * 1024 -- 2000 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

					if ok and stats and stats.size > max_filesize then
						return true
					end
					return false
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = true,
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = {
			"BufReadPost",
			"BufNewFile"
		},
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
			}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = {
			"InsertEnter"
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/vim-vsnip",
		},
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-p>'] = require'cmp'.mapping.select_prev_item(),
					['<C-n>'] = require'cmp'.mapping.select_next_item(),
					['<C-S-f>'] = require'cmp'.mapping.scroll_docs(-4),
					['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
					['<C-Space>'] = require'cmp'.mapping.complete(),
					['<C-e>'] = require'cmp'.mapping.close(),
					['<CR>'] = require'cmp'.mapping.confirm({
						behavior = require'cmp'.ConfirmBehavior.Insert,
						select = true,
					})
				},
				sources = {
					{ name = 'path' },                              -- file paths
					{ name = 'nvim_lsp', keyword_length = 3 },      -- from language server
					{ name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
					{ name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = 'buffer', keyword_length = 2 },        -- source current buffer
					{ name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
					{ name = 'calc'},                               -- source for math calculation
				},
				window = {
					completion = require'cmp'.config.window.bordered(),
					documentation = require'cmp'.config.window.bordered(),
				},
				formatting = {
					fields = {'menu', 'abbr', 'kind'},
					format = function(entry, item)
						local menu_icon ={
							nvim_lsp = 'λ',
							vsnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})
		end,
	},
	{
		"preservim/tagbar",
	},
	{
		"hedyhli/outline.nvim",
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
		},
		opts = {

		},
	},
}

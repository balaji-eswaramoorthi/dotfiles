return {
	{
		'nacro90/numb.nvim',
		event = {
			'CmdlineEnter',
		},
		config = function()
			require('numb').setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "GitSigns preview hunk" },
			{ "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Current Line Blame" },
		},
		config = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
		},
		init = function()
			-- Detect if the opened file is a directory
			local path = vim.fn.argv(0)
			if path and vim.fn.isdirectory(path) == 1 then
				vim.cmd("Neotree filesystem reveal left")
			end
		end,
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,					-- show hidden files
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						added     = " ✚ ",
						modified  = "  ",
						deleted   = " ✖ ",
						renamed   = " ➜ ",
						untracked = "  ",
						ignored   = " ◌ ",
						unstaged  = " ✗ ",
						staged    = " ✓ ",
						conflict  = "  ",

					}
				}
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		enabled = true,
		lazy = false,
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = { padding = 0 },
						height = { padding = 0 },
						preview_width = 0.5,
					},
					vertical = { width = 0.5 }
					-- other layout configuration here
				},
				file_ignore_patterns = {
					"node_modules",
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				diagnostics = {
					theme = "dropdown",
				},
			},
		},
		keys = {
			{
				"<leader>tlg",
				"<cmd>Telescope live_grep<CR>",
				desc = "Open Telescope live_grep window"
			},
			{
				"<leader>tgw",
				function()
					require("telescope.builtin").live_grep({
						default_text = vim.fn.expand("<cword>"),
					})
				end,
				desc = "Live grep word address under cursor",
			},
			{
				"<leader>tgm",
				function()
					require("telescope.builtin").live_grep({
						default_text = vim.fn.expand("<cWORD>"),
					})
				end,
				desc = "Live grep word address under cursor",
			},
		}
	},
}

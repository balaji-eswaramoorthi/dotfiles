return {
	{
		"github/copilot.vim",
		lazy_load = true,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		lazy_load = true,
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
		},
	},
}

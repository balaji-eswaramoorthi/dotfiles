-- Custom options

-- Plugin global configuation
vim.g.cpp_operator_highlight = 1
vim.g.cpp_member_highlight = 1
vim.g.cpp_type_name_highlight = 0

-- clipboard copy --
if vim.env.SSH_CLIENT or vim.env.SSH_TTY then
	if not vim.env.TMUX then
		vim.g.clipboard = {
			name = "OSC 52",
			copy = {
				["+"] = require("vim.ui.clipboard.osc52").copy("+"),
				["*"] = require("vim.ui.clipboard.osc52").copy("*"),
			},
			paste = {
				["+"] = function() return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") } end,
				["*"] = function() return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") } end,
			},
		}
	end
end

-- lsp configuation --
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Use Option + Enter to accept GitHub Copilot suggestions
-- C-CR did not work
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true

vim.g.mapleader = " " -- leader key

function toggleMouse()
	if vim.o.mouse == "a" then
		vim.o.mouse = ""
		print "toggleMouse: Mouse Disabled"
	else
		vim.o.mouse = "a"
		print "toggleMouse: Mouse Enabled"
	end
end

function toggle_terminal()
	for i, buffer in ipairs(vim.api.nvim_list_bufs()) do
		local buffer_name = vim.api.nvim_buf_get_name(buffer)
		if (string.sub(buffer_name, 1, 7) == "term://") then
			vim.api.nvim_win_set_buf(0, buffer)
			return
		end
	end
	vim.api.nvim_command(":terminal")
end

function listCharToggle()
	if vim.opt.list:get() == true then
		vim.opt.list = false
		print "listCharToggle: Disable"
	else
		vim.opt.list = true
		print "listCharToggle: Enabled"
	end
end

vim.keymap.set(
	"n",
	"<leader>it",
	":IBLToggle<CR>",
	{ desc = "Toggle indent-blankline" }
)

vim.keymap.set(
	"n",
	"<leader>m",
	":lua toggleMouse()<CR>",
	{ noremap = true, silent = true, desc = "Toggle mouse (Enable/Disable)" }
)

vim.keymap.set(
	"n",
	"<leader>sc",
	":close<CR>",
	{ noremap = true, silent = true, desc = "close the current window" }
)

vim.keymap.set(
	"n",
	"<leader>cmd",
	":lua toggle_terminal()<CR>",
	{ noremap = true, silent = true, desc = "Opens terminal in a buffer"}
)

vim.keymap.set(
	"n",
	"<leader>q",
	":quitall<CR>",
	{ noremap = true, silent = true, desc = "Quit all windows" }
)

vim.keymap.set(
	"n",
	"<leader>lct",
	":lua listCharToggle()<CR>",
	{ noremap = true, silent = true, desc = "Toggle list characters" }
)

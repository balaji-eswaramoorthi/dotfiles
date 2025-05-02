vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.opt.scrolloff = math.floor(vim.o.lines / 2 - 1)
	end,
})

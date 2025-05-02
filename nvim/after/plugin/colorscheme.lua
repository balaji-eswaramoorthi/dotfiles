env_sty = os.getenv("STY")

if (env_sty == nil) then
	vim.cmd("colorscheme carbonfox")
else
	vim.cmd("colorscheme lunaperche")
	vim.opt.termguicolors = false
end

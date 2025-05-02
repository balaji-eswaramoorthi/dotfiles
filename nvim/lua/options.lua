-- General Editing --

vim.opt.textwidth = 0				-- Auto-wrap text at given column value (0 to disable)
vim.opt.wrap = false				-- Disable text wrap
vim.opt.linebreak = false			-- Wrap only at word boundaries (with line wrap config)
vim.opt.showbreak = '↪ '			-- String to show at the start of wrapped lines
vim.opt.breakindent = true			-- Indent wrapped lines visually
vim.opt.syntax = 'off'

-- ⌫  Backspace Behavior
vim.opt.backspace = {
	'indent',
	'eol',
	'start'
}									-- Make backspace behave like most editors

-- ✍️ Indentation
vim.opt.autoindent = true			-- Copy indent from current line when starting new one
vim.opt.smartindent = true			-- Smarter autoindenting for C-like structures
vim.opt.copyindent = true			-- Copy indent structure from previous line
--vim.opt.preserveindent = true		-- Preserve existing indent structure when reindenting

-- ⛓️ Tabs & Spaces
vim.opt.tabstop = 4					-- Display width of a tab character
vim.opt.softtabstop = 4				-- Number of spaces a <Tab> counts for while editing
vim.opt.shiftwidth = 4				-- Spaces used for each step of (auto)indent
vim.opt.expandtab = false			-- Don't convert tabs to spaces
vim.opt.smarttab = true				-- Use shiftwidth when inserting tabs at the beginning of a line
vim.opt.shiftround = true			-- Round indent to a multiple of shiftwidth


-- File Handling --

-- 🌐 Encoding
vim.opt.fileencoding = 'utf-8'		-- Encoding to use when writing files
vim.opt.fileencodings = {
	'utf-8',
	'ucs-bom',
	'iso-8859-1'
}									-- Fallbacks when reading files

-- 📝 Line Endings
vim.opt.list = false				-- Disable list chars by default
vim.opt.listchars:append({
	--tab = '→ ',
	tab = "» ",
	space = '·',
	trail = '•',
	eol = '󱞥',
	--eol = '',
})									-- list chars configuration

vim.opt.fileformat = 'unix'			-- Use Unix line endings by default
vim.opt.fileformats = {
	'unix',
	'dos',
	'mac'
}									-- Try these formats when opening a file

-- 💾 Backups
vim.opt.backup = false				-- Don't keep backup file (use version control instead)
vim.opt.writebackup = false			-- Don't make a backup before overwriting a file

-- 🌀 Swap Files
vim.opt.swapfile = false			-- Disable swap files
vim.opt.directory = vim.fn.stdpath("state") .. "/swp//"		-- (Optional) Set custom swap file directory

-- ♻️ Undo History
vim.opt.undofile = true				-- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"		-- Directory to save undo history

-- 🔄 Autoread and Buffer Management
vim.opt.autoread = true				-- Auto reload file if changed outside of Neovim
vim.opt.hidden = true				-- Allow switching buffers without saving


-- UI & Appearance --

-- 🔢 Line Numbers
vim.opt.number = false				-- Show absolute line numbers
vim.opt.relativenumber = true		-- Show relative line numbers

-- 🎯 Cursor
vim.opt.cursorline = false			-- Highlight the line where the cursor is
vim.opt.cursorcolumn = false		-- Disable vertical cursor highlight (optional)

-- 🔍 Gutter
vim.opt.signcolumn = "yes"			-- Always show the sign column (This will avoid an annoying layout shift in the screen)
vim.opt.colorcolumn = "0"			-- Highlight column at given position (0 to disable)

-- 🖱️ Scrolling
vim.opt.scrolloff = 20				-- Keep 20 lines visible above/below cursor
vim.opt.sidescrolloff = 20			-- Keep 20 columns visible left/right of cursor
vim.opt.smoothscroll = true

-- 🧾 Window Title
vim.opt.title = true
--vim.opt.titlestring = "%<%F - nvim"  -- Customize title shown in terminal/tab

-- 📊 Status Line & Command Area
vim.opt.laststatus = 2				-- Global statusline (0=never, 1=minimal, 2=always, 3=global)
vim.opt.cmdheight = 1				-- Height of command line (0 with noice.nvim)
vim.opt.showcmd = true				-- Show partial command in last line
vim.opt.showmode = false			-- Don't show -- INSERT -- (statusline plugin handles it)
vim.opt.ruler = true				-- Show the cursor position

-- 🧠 Command Completion
vim.opt.wildmenu = true				-- Visual command-line completion menu

-- 📋 Popup Menu
vim.opt.pumheight = 10				-- Limit completion popup height
vim.opt.winblend = 0				-- Floating window transparency (0 - Disable)
vim.opt.pumblend = 0				-- Popup menu transparency (0 - Disable)

-- 🌈 Colors
vim.opt.termguicolors = true		-- Enable 24-bit RGB colors
vim.opt.guifont = "Consolas Nerd Font:h14"	-- GUI font (used by Neovide, goneovim, etc.)

-- 🕶️ Conceal (used for Markdown, JSON, etc.)
vim.opt.conceallevel = 2			-- Hide markup for better readability
vim.opt.concealcursor = "nc"		-- Conceal text in normal and command-line modes only


-- Input / Typing --

-- Timeout for mapped sequences
vim.opt.timeout = true				-- Enables timeout for mappings
vim.opt.timeoutlen = 500			-- Wait 500ms for a mapped sequence to complete

-- Timeout for key codes (like ESC key handling)
vim.opt.ttimeout = true				-- Enables timeout for key code sequences
vim.opt.ttimeoutlen = 10			-- Wait 10ms for key codes (makes ESC more responsive)

-- Mouse support
vim.opt.mouse = "a"					-- Enable mouse in all modes (normal, visual, insert)
vim.opt.mousemodel = "extend"		-- Mouse drag extends selection (other: "popup", "popup_setpos")

-- Clipboard integration
vim.opt.clipboard = "unnamedplus"	-- Use system clipboard for all operations


-- Search --

-- 🔍 Search Behavior
vim.opt.ignorecase = true			-- Ignore case in search patterns
vim.opt.smartcase = true			-- Override ignorecase if search pattern contains uppercase
vim.opt.hlsearch = true				-- Highlight all matches of previous search
vim.opt.incsearch = true			-- Show matches while typing search pattern
vim.opt.wrapscan = true				-- Search wraps around the end of the file

-- 🔎 External Grep Program (uses ripgrep if available)
vim.opt.grepprg = "rg --vimgrep --smart-case"	-- Set grep program to ripgrep with Vim-compatible output
vim.opt.grepformat = "%f:%l:%c:%m"	-- Format for parsing grep output (file:line:column:message)


-- 🔁 Completion & Wildmenu --

vim.opt.wildmode = {
	"longest:full",
	"full",
}									-- Command-line completion mode
vim.opt.wildignore = {
	"*.o",
	"*.obj",
	"*.dll",
	"*.jpg",
	"*.png",
	"*.gif",
	"*.zip",
	"*.pyc",
	"__pycache__/",
	"*/node_modules/*",
	"*/.git/*",
	"*/.hg/*",
	"*/.svn/*",
}
vim.opt.wildignorecase = false		-- Ignore case when completing filenames
vim.opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
	"noinsert",
	"popup"
}
vim.opt.infercase = true			-- Case-insensitive completion in insert mode


-- Performance --

--vim.opt.lazyredraw = true			-- Skip screen redraws during complex operations (noise plugin will not properly)
vim.opt.ttyfast = true				-- Assume fast terminal connection
vim.opt.updatetime = 300			-- Reduce delay before triggering CursorHold events (like LSP hover)
vim.opt.redrawtime = 10000			-- Increase redraw time for large files

vim.opt.swapfile = false			-- Don't use swap files (speeds up write, less disk I/O)
-- Disable backups before overwriting files
vim.opt.backup = false
vim.opt.writebackup = false

-- Faster file updates (for large edits)
vim.opt.undofile = true				-- Enable persistent undo
vim.opt.undolevels = 10000			-- Store more undo history
vim.opt.undoreload = 10000			-- Save undo for large files

vim.loader.enable()								-- Speed up loading Lua modules in Neovim to improve startup time.

-- ⚙️ Miscellaneous Settings --

vim.opt.shortmess:append("cI")		-- Avoid showing extra messages when using completion
--vim.opt.whichwrap:append("<,>,[,],h,l")		-- Allow certain keys to wrap to the next line

vim.opt.splitbelow = true			-- Horizontal splits open below
vim.opt.splitright = true			-- Vertical splits open to the right
vim.opt.equalalways = false			-- Do not resize windows automatically when splitting

vim.opt.scrollbind = false			-- Do not bind scrolling between windows by default
vim.opt.spell = false				-- Spell checking off by default
vim.opt.spelllang = { "en" }		-- Spellcheck language

vim.opt.formatoptions = "qjcro"		-- Auto formatting options (can tweak as needed)
vim.opt.virtualedit = "block"		-- Allow cursor to move where there is no text in visual block mode
vim.opt.startofline = false			-- Keep cursor position when switching lines

vim.opt.history = 1000				-- Command history size

vim.opt.sessionoptions = {
	"buffers",
	"curdir",
	"tabpages",
	"winsize",
	"help",
	"globals"
}									-- What to save in sessions

vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }		-- Skip backup for temp files

-- 🔒 Security Settings --

vim.opt.secure = true				-- Disable unsafe commands in .vimrc or modelines
vim.opt.modelines = 0				-- Completely disable modelines (safer alternative)
vim.opt.modeline = false			-- Another layer to disable modeline processing
vim.opt.modelineexpr = false		-- Prevent expressions in modelines (security risk)
vim.opt.fileignorecase = true		-- Case-insensitive file matching (helpful on Windows/macOS)

return {
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled", -- Compiled file suffix
				transparent = false,     -- Disable setting background
				terminal_colors = false,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false,    -- Non focused panes set to alternative background
				module_default = true,   -- Default enable value for modules
				colorblind = {
					enable = false,        -- Enable colorblind support
				},
				styles = {							-- Style to be applied to different syntax groups
					comments		= "NONE",		-- Value is any valid attr-list value `:help attr-list`
					conditionals	= "bold",
					constants		= "NONE",
					functions		= "bold",
					keywords		= "bold",
					numbers			= "NONE",
					operators		= "bold",
					strings			= "NONE",
					types			= "bold",
					variables		= "NONE",
				},
				modules = {				-- List of various plugins and additional options
					--"treesitter",
				},
			},
			palettes = {
				carbonfox = {
					bg1			= "#000000",		-- Black background
					red			= "#F50623",
					green		= "#00FF00",
					white		= "#FFFFFF",
					blue		= "#0000FF",
					orange		= "#FF6E13",
				},
			},
			specs = {
				-- As with palettes, the values defined under `all` will be applied to every style.
				all = {
					syntax = {
						-- Specs allow you to define a value using either a color or template. If the string does
						-- start with `#` the string will be used as the path of the palette table. Defining just
						-- a color uses the base version of that color.
					},
					git = {
						-- A color define can also be used
						changed = "#f4a261",
					},
				},
				carbonfox = {
					syntax = {
						bracket     = "white",               -- Brackets and punctuation (neutral)
						builtin0    = "red.base",            -- Builtin variables (alerts you it's special)
						builtin1    = "cyan.bright",         -- Builtin types (distinct and cool tone)
						builtin2    = "orange.bright",       -- Builtin constants (draws attention)
						builtin3    = "magenta.bright",      -- Reserved: alternate special highlight
						comment     = "cyan.bright",           -- Comments (dimmed to reduce visual noise)
						conditional = "magenta.base",        -- Conditionals and loops (recognizable)
						const       = "orange",              -- Constants, imports, booleans
						dep         = "gray",                -- Deprecated (low contrast, faded)
						field       = "blue.base",           -- Object fields (stand out but soft)
						func        = "blue",                -- Function names and titles
						ident       = "blue",                -- Identifiers (closely tied to fields)
						keyword     = "magenta.bright",      -- Keywords (strong control flow terms)
						number      = "yellow",              -- Numbers (bright and obvious)
						operator    = "white",               -- Operators (neutral, not too flashy)
						preproc     = "pink.bright",         -- Preprocessor (stand out)
						regex       = "green.bright",        -- Regex (vivid and unique)
						statement   = "magenta.base",        -- Statements (match keyword)
						string      = "green.bright",        -- Strings (lively but soft on eyes)
						type        = "yellow.base",         -- Type annotations (distinct)
						variable    = "cyan.base",           -- General variables
					},
				},
			},
			groups = {},
		},
		enabled = true,
	},
}

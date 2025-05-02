vim.filetype.add({
    pattern = {
		-- log file --
		["[%w_-]+%.log%.?%d*"] = "log",
		[ "messages.*" ] = "log",
		[ "hostapd%.txt.*"] = "log",

		-- config file --
		[".*%.conf"] = "dosini",
    },
	filename = {
		[ "messages" ] = "log",
	}
})

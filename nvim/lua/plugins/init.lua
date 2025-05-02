local Plugins = { }

Plugins.plugins = {
	require("plugins.automatum"),
	require("plugins.colorschemes"),
	require("plugins.ui"),
	--require("plugins.icons"),
	require("plugins.editor"),
	require("plugins.utils"),

	require("plugins.lsp"),
	require("plugins.languages"),
	require("plugins.copilot"),
}

return Plugins

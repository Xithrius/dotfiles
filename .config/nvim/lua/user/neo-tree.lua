local status_ok, ntree = pcall(require, "neo-tree")
if not status_ok then
	return
end

ntree.setup({
	window = {
		window = {
			position = "left",
			width = 40,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
	},
})

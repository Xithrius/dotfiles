local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		theme = "onedarkpro",

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {},
	extensions = {},
})

local color = require("onedarkpro.helpers")

local colors = color.get_colors()

local TelescopeColor = {
	TelescopePromptNormal = {
		bg = colors.surface0,
	},
	TelescopeResultsNormal = {
		bg = colors.surface0,
	},
	TelescopePreviewNormal = {
		bg = colors.surface0,
	},
	TelescopePromptBorder = {
		bd = colors.surface0,
	},
	TelescopeResultsBorder = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopePreviewBorder = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopePromptTitle = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopeResultsTitle = {
		fg = colors.surface0,
		bg = colors.surface0,
	},
	TelescopeSelectionCaret = {
		fg = colors.surface0,
	},
	TelescopeSelection = {
		bg = colors.surface0,
		fg = colors.surface0,
		bold = true,
	},
	TelescopeMultiSelection = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopeNormal = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopeBorder = {
		bg = colors.surface0,
		fg = colors.surface0,
	},
	TelescopePromptPrefix = {
		fg = colors.surface0,
		bg = colors.surface0,
	},
	TelescopeMatching = {
		fg = colors.surface0,
		bg = colors.surface0,
	},
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end

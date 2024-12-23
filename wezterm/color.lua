local c = require("palette")
return {
	foreground = c.text,
	background = c.base,

	cursor_fg = c.crust,
	cursor_bg = c.rosewater,
	cursor_border = c.rosewater,

	selection_fg = c.text,
	selection_bg = c.surface2,

	scrollbar_thumb = c.surface2,

	split = c.blue,

	ansi = {
		c.surface1,
		c.red,
		c.green,
		c.yellow,
		c.blue,
		c.pink,
		c.teal,
		c.subtext1,
	},

	brights = {
		c.surface2,
		c.red,
		c.green,
		c.yellow,
		c.blue,
		c.pink,
		c.teal,
		c.subtext0,
	},

	indexed = { [16] = c.peach, [17] = c.rosewater },

	-- nightbuild only
	compose_cursor = c.flamingo,

	tab_bar = {
		background = c.base,
		active_tab = {
			bg_color = c.mauve,
			fg_color = c.crust,
		},
		inactive_tab = {
			bg_color = c.mantle,
			fg_color = c.text,
		},
		inactive_tab_hover = {
			bg_color = c.base,
			fg_color = c.text,
		},
		new_tab = {
			bg_color = c.surface0,
			fg_color = c.text,
		},
		new_tab_hover = {
			bg_color = c.surface1,
			fg_color = c.text,
		},
		-- fancy tab bar
		inactive_tab_edge = c.surface0,
	},

	visual_bell = c.surface0,
}

local M = {}

M.pill_builder = function(base, secondary, leftEdge, rightEdge, formatter)
	local format = formatter or function(x)
		return x
	end
	local N = {}
	N.pill = function(text, color)
		return {
			content = format({
				{ Foreground = { Color = color } },
				{ Background = { Color = base } },
				{ Text = leftEdge },
				{ Foreground = { Color = secondary } },
				{ Background = { Color = color } },
				{ Text = text },
				{ Foreground = { Color = color } },
				{ Background = { Color = base } },
				{ Text = rightEdge },
			}),
			length = utf8.len(leftEdge .. text .. rightEdge),
		}
	end
	N.pill_label = function(icon, text, color, secondary_override)
		local background = secondary_override or secondary
		return {
			content = format({
				{ Foreground = { Color = color } },
				{ Background = { Color = base } },
				{ Text = leftEdge },
				{ Foreground = { Color = background } },
				{ Background = { Color = color } },
				{ Text = icon .. " " },
				{ Foreground = { Color = color } },
				{ Background = { Color = background } },
				{ Text = " " .. text },
				{ Foreground = { Color = background } },
				{ Background = { Color = base } },
				{ Text = rightEdge },
			}),
			length = utf8.len(leftEdge .. icon .. "  " .. text .. rightEdge),
		}
	end
	return N
end
return M

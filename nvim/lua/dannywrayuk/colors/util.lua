return function(c, g, option)
	local function hexToRgb(col)
		col = string.lower(col)
		return { tonumber(col:sub(2, 3), 16), tonumber(col:sub(4, 5), 16), tonumber(col:sub(6, 7), 16) }
	end

	local function blend(foreground, background, alpha)
		alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
		local bg = hexToRgb(background)
		local fg = hexToRgb(foreground)

		local blendChannel = function(i)
			local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
			return math.floor(math.min(math.max(0, ret), 255) + 0.5)
		end

		return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
	end

	local function darken(hex, amount, bg)
		return blend(hex, bg or c.bg, amount)
	end

	local function lighten(hex, amount, fg)
		return blend(hex, fg or c.fg, amount)
	end

	return {
		blend = blend,
		darken = darken,
		lighten = lighten,
	}
end

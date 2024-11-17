return function(c, g, options, util)
	return {
		LazyProgressDone = { bold = true, fg = c.magenta2 },
		LazyProgressTodo = { bold = true, fg = g.bg.lower },
	}
end

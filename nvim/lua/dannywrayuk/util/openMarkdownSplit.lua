local screenSizeSwap = require("dannywrayuk.util.screenSizeSwap")
return function(lines)
	if vim.tbl_isempty(lines) then
		vim.api.nvim_err_writeln("No information available")
		return
	end
	vim.cmd(
		screenSizeSwap("belowright split", "vsplit")
			.. " | enew | setlocal buftype=nofile bufhidden=wipe noswapfile filetype=markdown conceallevel=2"
	)
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines) -- Set the hover information in the buffer
end

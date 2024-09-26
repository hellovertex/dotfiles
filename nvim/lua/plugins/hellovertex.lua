local pickers = require('telescope.pickers')

local M = {}

M.print_hello = function() 
	print("Hello, World!")
	print(pickers)
end

M.print_hello()

return M





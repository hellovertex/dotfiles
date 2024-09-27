-- TODO: add a hook when a file has been opened, check if it was a .norg file, and if yes,
-- then go to the index file of the calender workspace, and try to create a link under YY MM for dd.norg
--
local M = {}

M.preview = function()
    print("Hello from Hooks")
end

M.preview()

return M

local pickers = require('telescope.pickers')
local config = require('telescope.config').values
local previewers = require('telescope.previewers')
local finders = require('telescope.finders')
local utils = require('telescope.previewers.utils')
-- local jumper = require('telescope.builtin').jumplist{} 

local M = {}

-- M.hello = function()
--     print(jumper)
-- end

--M.hello() 


local log = require('plenary.log'):new()
log.level = 'debug'

M.show_preview = function(opts)
    print("Hello from Calendar")
    pickers.new(opts, {
        finder = finders.new_async_job({
            -- results = {
            --     { name = "no",      value = { 1, 2, 3 } },
            --     { name = "maybe",   value = { 2, 3, 4 } },
            --     { name = "perhaps", value = { 3, 4, 5 } },
            -- },
            command_generator = function()
                return {"git"}
            end,
            entry_maker = function(entry)
                log.debug(entry)
                return {
                    value = entry.value,
                    display = entry.name,
                    ordinal = entry.name,
                }
            end
        }),
        sorter = config.generic_sorter(opts),
        previewer = previewers.new_buffer_previewer({
            title = "Journal Entry",
            define_preview = function(self, entry)
                vim.api.nvim_buf_set_lines(
                    self.state.bufnr, 
                    0, 
                    0, 
                    true,
                    vim.tbl_flatten({
                        "**Hello**",
                        "Everyone",
                        "",
                        "```lua",
                        vim.split(vim.inspect(entry.value), "\n"),
                        "```",
                    })
                )
                utils.highlighter(self.state.bufnr, "markdown")
            end,
        }),
    }):find()
end

-- M.show_preview()

return M


-- local cal = require("neorg.core")
-- vim.print(cal)
-- Idea: Create file `lazy/nvim-treesitter-textobjects/queries/calendar/textobjects.scm`
--  so that we can use our calendar as treesitter textobjects with all the perks
--  and then do something like
--  keymaps = {
--       ["aF"] = "@custom_capture",
-- But maybe we would hhave to compile our own parser in that case...
--
--
--
-- TODO: startup hook that calls :Neorg journal custom? hm no, lets start our own ascii frontend
-- when booting into the calendar, select current day
-- when pressing RET, go to file with selected day
-- local pickers = require('telescope.pickers')
--
-- local M = {}
--
-- M.print_hello = function()
-- 	print("Hello, World!")
-- 	print(pickers)
-- end
--
-- M.print_hello()
--
-- return M


-- -- Helper to get the first day and number of days in the current month
-- local function get_calendar_info()
--     local current_time = os.time()
--     local current_day = os.date("*t", current_time)
--     local first_day_of_month = os.time{year=current_day.year, month=current_day.month, day=1}
--     local days_in_month = os.date("*t", os.time{year=current_day.year, month=current_day.month+1, day=0}).day
--     return {
--         year = current_day.year,
--         month = current_day.month,
--         first_day = os.date("*t", first_day_of_month).wday,
--         days_in_month = days_in_month
--     }
-- end
--
-- -- Calculate which day was selected based on cursor position
-- local function calculate_selected_day(row, col)
--     -- Logic to convert cursor position (row, col) into a day in the calendar grid
--     -- Adjust based on your ASCII grid layout
--     local cal_info = get_calendar_info()
--
--     -- Assuming your calendar starts with "Sun Mon Tue..." on the first line
--     -- And day numbers start on the second line, offset by the starting day of the month
--
--     local first_day = cal_info.first_day
--     local days_in_month = cal_info.days_in_month
--
--     -- The row should map to the week (row 2 corresponds to the first week of days), and col to the day (each cell is 3 characters wide)
--     local day_offset = (row - 2) * 7 + math.floor(col / 4) - first_day + 1
--
--     if day_offset >= 1 and day_offset <= days_in_month then
--         return day_offset
--     end
--
--     -- Return nil if no valid day was selected
--     return 3
-- end
--
-- -- Open the corresponding .norg file based on the selected day
-- local function open_norg_file(day)
--     local cal_info = get_calendar_info()
--     local year = cal_info.year
--     local month = cal_info.month
--     local day_str = string.format("%04d-%02d-%02d", year, month, day)
--
--     local file_path = string.format("%04d/%02d/%s.norg", year, month, day_str)
--     vim.cmd("edit " .. file_path)
-- end
--
-- -- Main plugin functions
-- local calendar = {}
--
-- -- Generate the ASCII calendar grid
-- local function generate_ascii_calendar()
--     local cal_info = get_calendar_info()
--     local year = cal_info.year
--     local month = cal_info.month
--     local first_day = cal_info.first_day -- 1 = Sunday, 7 = Saturday
--     local days_in_month = cal_info.days_in_month
--
--     local lines = {"Sun Mon Tue Wed Thu Fri Sat"}
--
--     -- Start padding for the first row
--     local row = {}
--     for i = 1, first_day - 1 do
--         table.insert(row, "   ")
--     end
--
--     -- Fill in the days
--     for day = 1, days_in_month do
--         table.insert(row, string.format("%3d", day))
--         if #row == 7 then
--             table.insert(lines, table.concat(row, " "))
--             row = {}
--         end
--     end
--
--     if #row > 0 then
--         table.insert(lines, table.concat(row, " "))
--     end
--
--     return lines
-- end
--
-- -- Open the calendar in a new buffer
-- function calendar.open()
--     local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
--     vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
--     vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
--     vim.api.nvim_buf_set_option(buf, 'swapfile', false)
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, generate_ascii_calendar()) -- Set buffer lines
--
--     local win = vim.api.nvim_get_current_win()
--     vim.api.nvim_win_set_buf(win, buf)
--
--     -- Key mapping for selecting a day
--     vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', [[<cmd>lua require('plugins.calendar').select_day()<CR>]], {noremap = true, silent = true})
-- end
--
-- -- Handle day selection
-- function calendar.select_day()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     local row, col = cursor[1], cursor[2]
--
--     -- Adjust based on your ASCII grid layout
--     local selected_day = calculate_selected_day(row, col)
--     if selected_day then
--         open_norg_file(selected_day)
--     else
--         print("Invalid day selected!")
--     end
-- end
-- -- calendar.open()
-- return calendar

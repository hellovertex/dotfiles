local pickers = require('telescope.pickers')
local config = require('telescope.config').values
local previewers = require('telescope.previewers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local utils = require('telescope.previewers.utils')
local Path = require('plenary.path')
local M = {}
local calender_dir = 'C:\\Users\\hellovertex\\calendar'
-- This function extracts the journal links from index.norg
local function extract_journal_links()
    local links = {}
    local index_file = Path:new(calender_dir .. '\\index.norg'):read()

    for link in index_file:gmatch('{:%$calendar/journal/[0-9]+/[0-9]+/[0-9]+%.norg:}') do
        table.insert(links, link:match('{:(%$calendar/journal/[0-9]+/[0-9]+/[0-9]+%.norg):}'))
    end

    return links
end

local log = require('plenary.log'):new()
log.level = 'debug'
-- Function to open a file in a buffer, creating a new one if needed
function OpenFileInBuffer(filepath)
    -- Get the absolute path for comparison
    local abs_path = vim.fn.fnamemodify(filepath, ":p")
    -- On Windows, replace forward slashes with backslashes for Neovim's 'edit' command
    if vim.loop.os_uname().version:match("Windows") then
        abs_path = abs_path:gsub("/", "\\")
        log.debug("New ABS PATH IS: ", abs_path)
    end
    -- Iterate over all listed buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local bufname = vim.api.nvim_buf_get_name(buf)
            bufname = bufname:gsub("/", "\\")
            if vim.fn.fnamemodify(bufname, ":p") == abs_path then
                -- Buffer with the file is already open, switch to it
                vim.api.nvim_set_current_buf(buf)
                return
            end
        end
    end
    -- If no buffer is found, open the file in a new buffer
    vim.api.nvim_command('edit ' .. tostring(abs_path))
end

M.show_preview = function(opts)
    print("Hello from Calendar")
    local links = extract_journal_links()
    pickers.new(opts, {
        finder = finders.new_table({
            results = links,
            entry_maker = function(entry)
                -- parsed format is /journal/YYYY/MM/dd.norg
                log.debug("Entry: " .. entry)
                local parsed = vim.split(entry, "calendar")[2]
                log.debug("Parsed: " .. parsed)
                local sanitized_value = parsed:gsub("^%s*(.-)%s*$", "%1")
                log.debug("Sanitized: " .. sanitized_value)
                local filepath = calender_dir .. sanitized_value
                log.debug("Filepath: " .. filepath)
                return {
                    -- TODO: use telescope.actions to open the correct file when pressing RET in the previewer
                    value = Path:new(filepath),
                    display = filepath,
                    ordinal = filepath,
                }
            end
        }),
        sorter = config.generic_sorter(opts),
        previewer = previewers.new_buffer_previewer({
            title = "Journal Entry",
            define_preview = function(self, entry)
                --                local sanitized_value = entry.value:gsub("^%s*(.-)%s*$", "%1")
                --                local filepath = Path:new(calender_dir, sanitized_value)
                log.debug("Entry2: " .. vim.inspect(entry))
                local filecontent = entry.value:read()
                log.debug(filecontent)
                vim.api.nvim_buf_set_lines(
                    self.state.bufnr,
                    0,
                    0,
                    true,
                    vim.tbl_flatten({
                        -- "**Hello**",
                        -- "Everyone",
                        -- "",
                        -- "```lua",
                        --                        vim.split(vim.inspect(entry.value), "\n"),
                        vim.split(vim.inspect(filecontent), "\n"),
                        -- "```",
                    })
                )
                --utils.highlighter(self.state.bufnr, "markdown")
            end,
        }),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                log.debug("Selected: ", selection.display)
                -- TODO: fix open selection.display in buffer
                actions.close(prompt_bufnr)
                OpenFileInBuffer(selection.display)
            end
            )
            return true
        end
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

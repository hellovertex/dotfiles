local pickers = require('telescope.pickers')
local config = require('telescope.config').values
local previewers = require('telescope.previewers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local utils = require('telescope.previewers.utils')
local Path = require('plenary.path')
local M = {}
local calender_dir = 'C:\\Users\\hellovertex\\Documents\\github.com\\hellovertex\\journal'
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
                log.debug("FILECONTENT: ", filecontent)
                -- Replace all occurrences of carriage return with an empty string
                filecontent = filecontent:gsub("\r", "")
                vim.api.nvim_buf_set_lines(
                    self.state.bufnr,
                    0,
                    0,
                    true,
                    vim.tbl_flatten({
                        -- "**Hello**",
                        -- "Everyone",
                        -- "",
                        "```markdown",
                        --                        vim.split(vim.inspect(entry.value), "\n"),
                        vim.split(filecontent, "\n"),
                        "```",
                    })
                )
                utils.highlighter(self.state.bufnr, "markdown")
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

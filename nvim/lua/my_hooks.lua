local norg_template_path = vim.fn.expand("~/AppData/Local/nvim/templates/norg/journal.norg")

local M = {}

M.preview = function()
  print("Hello from Hooks")
end

M.preview()

-- Run :Neorg toggle-concealer on startup
-- -- This did not work
-- vim.api.nvim_create_autocmd("filetype", {
--   pattern = "*.norg",
--   callback = function()
--     vim.cmd("Neorg toggle-concealer")
--   end
-- })


-- On .norg file open, create link in index.norg if it does not exist already
-- vim.api.nvim_create_autocmd("filetype", {
--   pattern = "norg",
--   callback = function()
--     print("Hello NORG CALLBACK")
-- --    vim.cmd("Neorg toggle-concealer")
--   end
-- })
-- Function to check if the buffer is empty
local function is_buffer_empty()
  local line_count = vim.api.nvim_buf_line_count(0)
  if line_count == 1 then
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
    return first_line == ""
  end
  return false
end
-- Function to populate a file with template content
function populate_template(template_path, substitutions)
  if vim.api.nvim_buf_get_option(0, "modifiable") then
    local file = io.open(template_path, "r")
    if file then
      local template = file:read("*all")
      file:close()

      -- Replace placeholders with dynamic content
      for placeholder, value in pairs(substitutions) do
        template = template:gsub(placeholder, value)
      end

      -- Insert the modified template into the buffer
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
      --vim.cmd("write")
    end
  end
end

function insert_norg_template()
  -- Read template file and replace all variables with their values using lua
  local filepath = vim.fn.expand("%:p")
  local target_dir = vim.fn.expand("C:\\Users\\hellovertex\\Documents\\github.com\\hellovertex\\journal\\journal")
  if filepath:sub(1, #target_dir) == target_dir then
    vim.cmd("Neorg toggle-concealer")
    -- Pattern to capture the last two subdirectories (year/month) and the filename (day)
    local year, month, day = filepath:match(".*\\(%d+)\\(%d+)\\(%d+)%.norg")
    -- Convert the extracted year, month, and day to a Lua table for the date
    local date_table = {
      year = tonumber(year),
      month = tonumber(month),
      day = tonumber(day)
    }

    -- Use os.time to convert the date table into a timestamp
    local timestamp = os.time(date_table)

    -- Get the weekday abbreviation using os.date
    local weekday_abbr = os.date("%a", timestamp) -- %a gives the abbreviated weekday name

    -- Format the final datestring with the weekday abbreviation
    local datestring = string.format("%s-%s-%s (%s)", year, month, day, weekday_abbr)
    local substitutions = {
      -- todo: how in lua, do we get 2024-10-10 from filepath 2024/10/10.norg
      ["{{TODAY}}"] = datestring -- os.date("%Y-%m-%d")
    }
    if is_buffer_empty() then
      populate_template(norg_template_path, substitutions)
      -- goto index.norg and at the very bottom append reflink
      local reflink = string.format("- {:$journal/journal/%s/%s/%s.norg:}[%s-%s-%s]\n", year, month, day, year, month, day)
      local file = io.open("C:\\Users\\hellovertex\\Documents\\github.com\\hellovertex\\journal\\index.norg", "a")
      if file then
        -- Attempt to write to the file
        local success, writeErr = file:write(reflink)

        if not success then
          print("Error writing to file: " .. writeErr) -- Print error if writing fails
        else
          file:flush()                               -- Ensure the data is written immediately
          file:close()                               -- Always close the file after writing
          vim.cmd("checktime")
          print("Text appended successfully!")
        end
      end
    end
  end
end

vim.api.nvim_create_autocmd("filetype", {
  pattern = "norg",
  callback = insert_norg_template
})
return M

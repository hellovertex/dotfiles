-- TODO: add a hook when a file has been opened, check if it was a .norg file, and if yes,
-- then go to the index file of the calender workspace, and try to create a link under YY MM for dd.norg
--
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
      vim.cmd("write")
    end
  end
end

local norg_template_path = vim.fn.expand("~/AppData/Local/nvim/templates/norg/journal.norg")
function insert_norg_template()
  -- Read template file and replace all variables with their values using lua
  local filepath = vim.fn.expand("%:p")
  local target_dir = vim.fn.expand("~/calendar/journal")
  if filepath:sub(1, #target_dir) == target_dir then
    vim.cmd("Neorg toggle-concealer")
    local substitutions = {
      ["{{TODAY}}"] = os.date("%Y-%m-%d")
    }
    if is_buffer_empty() then
      populate_template(norg_template_path, substitutions)
    end
  end
end

-- vim.api.nvim_create_autocmd("filetype", {
--   pattern = "norg",
--   callback = insert_norg_template
-- })
print(vim.bo.buftype)
return M

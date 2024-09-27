-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- added to create directories from within neovim
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- gui theme
    {
      "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
      config = function()
          vim.cmd.colorscheme("kanagawa")
      end,
    },
    -- treesitter plugin
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        highlight = { enable = true },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
           local lspconfig = require('lspconfig')
        end
    },
--     {
--         "neovim/nvim-lspconfig",
-- 		settings = {
--             Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT for Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = vim.split(package.path, ';'),
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {'vim'},
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false,  -- Disable third party checks
--             },
--             telemetry = {
--                 enable = false,  -- Disable telemetry data collection by the Lua language server
--             },
--         },
--     },
-- 
--         
--     },
    -- neorg plugin --  2024-09-25 -- Added as potential backend for calendar frontend
    {
      "nvim-neorg/neorg",
      lazy = false,
      version = "*",
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  calendar = "~/calendar",
                },
                default_workspace = "calendar",
              },
            },
          },
        }
  
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
    },
  },
})

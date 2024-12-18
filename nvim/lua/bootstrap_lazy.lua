-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local actions = require "telescope.actions"
        require("telescope").setup {
          pickers = {
            buffers = {
              mappings = {
                i = {
                  ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                }
              }
            }
          }
        }
      end
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
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        lspconfig.lua_ls.setup {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            })
          end,
          settings = {
            Lua = {}
          }
        }
      end
    },
    -- mason to handle LSP server installation -- 2024-09-27
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        })
      end,
    },
    -- Autocompletion for LUA
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
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
                  calendar = "C:\\Users\\hellovertex\\Documents\\github.com\\hellovertex\\journal",
                },
                default_workspace = "calendar",
              },
            },
          },
        }
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
      -- Added 2024-10-10 for dynamic journal templates, see
      -- https://github.com/pysan3/neorg-templates
      -- BUT OFC does not work under windows
      dependencies = { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } }, -- ADD THIS LINE

    },
  },
})



-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})

vim.cmd('set guifont=Consolas:h12')

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.ui = {
  theme = "onedark",
  theme_toogle = { "onedark", "vscode_dark" },
}

M.plugins = require "custom.plugins"

--   options = {
--       -- lspconfig = {
--       --    setup_lspconf = "custom.plugins.lspconfig",
--       -- },
--
--       statusline = {
--          separator_style = "round",
--       },
--    },
--
--   override = {
--     ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
--     ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
--     ["williamboman/mason"] = pluginConfs.mason,
--     -- ["goolord/alpha-nvim"] = pluginConfs.alpha,
--   }
-- }

M.options = {
   user = function ()
      vim.opt.relativenumber = true
   end,
}

M.mappings = require "custom.mappings"



return M

local overrides = require "custom.plugins.overrides"

return {

  ---------------------------- default plugins --------------------------------

  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    -- cmd = "Alpha",
    override_options = overrides.alpha,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["folke/which-key.nvim"] = {
    disable = false
  },


  -------------------------- custom plugins ---------------------------------

  ["tpope/vim-dadbod"] = {},

  ["tpope/vim-dotenv"] = {},

  ["kristijanhusak/vim-dadbod-ui"] = {
    config = function ()
      require("custom.plugins.smolconfigs").dadbodui()
    end
  },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function ()
         require "custom.plugins.null-ls"
      end,
   },

   ["sunjon/shade.nvim"] = {
    module = "shade",
    config = function()
       require("custom.plugins.smolconfigs").shade()
    end,
  },

   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact", "razor", "cshtml" },
      after = "nvim-treesitter",
      config = function()
         require("custom.plugins.smolconfigs").autotag()
      end,
   },


   ["luisiacc/gruvbox-baby"] = {},
  ["navarasu/onedark.nvim"] = {},
  ["olimorris/onedarkpro.nvim"] = {},

   ["mfussenegger/nvim-dap"] = {},

   ["rcarriga/nvim-dap-ui"] = {},

   ["theHamsta/nvim-dap-virtual-text"] = {},

   ["nvim-telescope/telescope-dap.nvim"] = {},

   ["nvim-telescope/telescope-ui-select.nvim"] = {},

   ["simrat39/rust-tools.nvim"] = {},

   ["jlcrochet/vim-razor"] = {},

  --  ["folke/todo-comments.nvim"] = {
  --   config = function ()
  --     require("todo-comments").setup {}
  --   end
  -- }
}

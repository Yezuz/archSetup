local M = {}

M.shade = function ()
   local present, shade = pcall(require, "shade")

   if not present then
      return
   end

   shade.setup {
      overlay_opacity = 50,
      opacity_step = 1,
      exclude_filetypes = { "NvimTree" },
   }
end

M.autotag = function ()
   local present, autotag = pcall(require, "nvim-ts-autotag")

   if present then
      autotag.setup({
      filetype = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
        'xml',
        'php',
        'markdown',
        'glimmer',
        'handlebars',
        'hbs',
        'cshtml',
        'razor'
      }
    })
   end
end

M.dadbodui = function ()
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_show_database_icon = 1
  vim.g.db_ui_force_echo_notifications =1
  vim.g.db_ui_auto_execute_table_helpers = 1
end

return M

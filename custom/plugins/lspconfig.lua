local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
  "html",
  "cssls",
  "bashls",
  "emmet_ls",
  "tsserver",
  "clangd",
  -- "omnisharp",
  "rust_analyzer",
  "phpactor",
  "marksman",
  "svelte",
  "angularls",
  -- "denols",
  "csharp_ls",
  "sqlls"
}

for _, lsp in ipairs(servers) do

  if lspconfig["omnisharp"] then
    lspconfig["omnisharp"].setup({
      cmd = { "dotnet", "/home/jesus/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_deman = false,
      enable_roslyn_analyzers = false,
      organize_imports_on_format = true,
      enable_import_completion = true,
      sdk_include_prereleases = true,
      analyze_open_documents_only = false,
    })
  end

  if lspconfig["emmet_ls"] then
    lspconfig["emmet_ls"].setup({
      filetypes = {
        'html',
        'typescriptreact',
        'javascriptreact',
        'css',
        'sass',
        'scss',
        'less',
        'cshtml',
        'razor'
      },
      init_options = {
        html = {
          options = {
            ["jsx.enabled"] = true,
          }
        }
      }
    })
  end

  -- if lspconfig["sqlls"] then
  --   lspconfig["sqlls"].setup({
  --
  -- })

  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

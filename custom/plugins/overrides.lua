-- overriding default plugin configs

local M = {}


M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
      "c_sharp",
      "javascript",
      "rust",
      "typescript",
      "tsx",
      "php",
      "markdown",
      "svelte",
      "sql"
   },
  indent = { enable = true, disable = { "rust" } },
}


M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "left",
      width = 20,
   },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      }
    }
  }
}


M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "angularls",
    "json-lsp",
    "csharp_ls",
    "rust-analyzer",
    "phpactor",
    -- shell
    "shfmt",
    "shellcheck",
    "sqlls"
  },
}


M.alpha = {
  header = {
    type = "text",
    val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
  },
}


return M

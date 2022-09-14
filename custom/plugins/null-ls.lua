local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- general webdev stuff
   b.formatting.prettierd,
   b.formatting.fixjson,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,

   -- cpp
   b.formatting.clang_format,

   -- rust
   b.formatting.rustfmt,

   -- c#
   b.formatting.csharpier,

   -- Spellcheck
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- javascript variants
   -- b.diagnostics.eslint_d,
   -- b.code_actions.eslint_d,

   -- php
   b.formatting.phpcsfixer,

}

null_ls.setup {
   debug = true,
   sources = sources,
}

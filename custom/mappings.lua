local M = {}

M.dap = {
   n = {
      ["<F5>"] = { "<cmd> DapContinue <CR>", " Start/Continue Debugging" },
      ["<F10>"] = { "<cmd> DapStepOver <CR>", " Step Over" },
      ["<F11>"] = { "<cmd> DapStepInto <CR>", " Step Into" },
      ["<F12>"] = { "<cmd> DapStepOut <CR>", " Step Out" },
      ["<leader>br"] = { "<cmd> DapToggleBreakpoint <CR>", " Toggle Breakpoint" },
   }
}

M.shade = {
   n = {
      ["<leader>sh"] = {"<cmd> EnableShade <CR>", " Shade" },
   },
}

return M

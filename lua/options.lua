-------------------
-- BASIC OPTIONS --
-------------------
vim.opt.relativenumber = true
vim.opt.termguicolors = true

----------------------
-- PRETTIER OPTIONS --
----------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}

--------------------
-- ESLINT OPTIONS --
--------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}


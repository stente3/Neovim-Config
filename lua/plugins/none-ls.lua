-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.prettier, -- Formateo automático
      -- null_ls.builtins.diagnostics.eslint_d, -- Linter rápido
    })
  end,
}

-- user/settings/linting.lua
local lint = require("lint")

-- Configuración de linters por tipo de archivo
lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },
  python = { "pylint" },
}

-- Crear un grupo de autocomandos para linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Configurar los autocomandos para activar linting
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()  -- Intentar linting en los eventos especificados
  end,
})

-- Configuración del keymap para ejecutar linting manualmente
vim.keymap.set("n", "<leader>cl", function()
  lint.try_lint()  -- Intentar linting
  vim.notify("Linting ejecutado para el archivo actual")  -- Notificación al usuario
end, { desc = "Trigger linting for current file" })


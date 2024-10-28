-- user/settings/formatting.lua
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		liquid = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},
})

-- Cambia el keymap a <leader>cf
vim.keymap.set({ "n", "v" }, "<leader>cp", function()
	-- Ejecuta el formateo
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})

	-- Muestra la notificación después de completar el formateo
	vim.notify("Formato aplicado correctamente", vim.log.levels.INFO)
end, { desc = "Format file or range (in visual mode)" })

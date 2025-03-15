return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-null-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Configurar linters y formatters
		null_ls.setup({
			sources = {
				-- 🔹 FORMATEADORES
				null_ls.builtins.formatting.prettier, -- JS, TS, HTML, CSS
				null_ls.builtins.formatting.stylua, -- Lua

				-- 🔹 LINTERS
				null_ls.builtins.diagnostics.eslint_d, -- JavaScript/TypeScript
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					-- 📌 Keymap para formatear código manualmente con <leader>F
					vim.keymap.set("n", "<leader>F", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = bufnr, desc = "Formatear código" })
				end
			end,
		})

		-- Integración con Mason para instalar linters/formatters automáticamente
		require("mason-null-ls").setup({
			ensure_installed = { "prettier", "stylua", "eslint_d" },
			automatic_installation = true,
		})
	end,
}

return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- Configurar el servidor de Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})

		-- Configuración del servidor para JS and TS
		lspconfig.ts_ls.setup({})

		-- Configuración global de keymaps al adjuntar un servidor LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local opts = { buffer = ev.buf }
				local keymap = vim.keymap.set

				-- 📌 Saltos y navegación
				keymap("n", "gd", vim.lsp.buf.definition, opts) -- Ir a la definición
				keymap("n", "gD", vim.lsp.buf.declaration, opts) -- Ir a la declaración
				keymap("n", "gr", vim.lsp.buf.references, opts) -- Ver referencias
				keymap("n", "gi", vim.lsp.buf.implementation, opts) -- Ir a la implementación
				keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts) -- Ir a la definición de tipo

				-- 📌 Información y documentación
				keymap("n", "K", vim.lsp.buf.hover, opts) -- Mostrar documentación flotante
				keymap("n", "<leader>sh", vim.lsp.buf.signature_help, opts) -- Mostrar firma de función
				keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts) -- Agregar carpeta al workspace
				keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts) -- Quitar carpeta del workspace
				keymap("n", "<leader>wl", function() -- Mostrar carpetas en el workspace
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)

				-- 📌 Acciones y correcciones
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Renombrar variable/símbolo
				keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Mostrar acciones disponibles
				keymap("n", "<leader>f", function() -- Formatear código
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- 📌 Diagnósticos y errores
				keymap("n", "<leader>e", vim.diagnostic.open_float, opts) -- Mostrar errores en un popup
				keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- Ir al error anterior
				keymap("n", "]d", vim.diagnostic.goto_next, opts) -- Ir al siguiente error
				keymap("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Abrir lista de errores
			end,
		})
	end,
}

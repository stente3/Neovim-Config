return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Fuente para LSP
		"hrsh7th/cmp-buffer", -- Palabras del buffer actual
		"hrsh7th/cmp-path", -- Rutas de archivos
		"hrsh7th/cmp-cmdline", -- Autocompletado en línea de comandos
		"L3MON4D3/LuaSnip", -- Soporte para snippets
		"saadparwaiz1/cmp_luasnip", -- Fuente de snippets
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Palabras del buffer actual
				{ name = "path" }, -- Autocompletado de rutas
			}),
		})
	end,
}

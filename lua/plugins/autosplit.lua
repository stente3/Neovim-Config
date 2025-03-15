return {
	{
		"yochem/autosplit.nvim",
		config = function()
			require("autosplit").setup({
				split = "auto", -- Opciones: 'auto', 'horizontal', 'vertical'
				min_win_width = 80, -- Ancho mínimo deseado para una ventana dividida
			})

			-- Atajos de teclado para dividir la pantalla
			vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true }) -- División vertical
		end,
	},
}

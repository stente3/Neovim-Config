return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }, -- Dependencia requerida
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto en archivos" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buscar buffers abiertos" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar en la ayuda de Neovim" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Comandos disponibles" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Buscar TODOs" },
		{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Buscar notificaciones" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/" }, -- Ignorar archivos innecesarios
				layout_config = { prompt_position = "top" }, -- Colocar el prompt arriba
				sorting_strategy = "ascending", -- Ordenar resultados de arriba hacia abajo
			},
		})
	end,
}

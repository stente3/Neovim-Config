lvim.plugins = {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false, -- No usar carga diferida
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Configuración de Harpoon
      require("harpoon").setup({
        menu = {
          width = 60, -- Ancho del menú de Harpoon
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- Usa la configuración por defecto, puedes personalizarlo si lo deseas
    cmd = "Trouble"
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "yochem/autosplit.nvim",
    config = function()
      require("autosplit").setup({
        split = "vertical", -- Puede ser 'auto', 'horizontal' o 'vertical'
        min_win_width = 80, -- Ancho mínimo para dividir la ventana automáticamente
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.obsidian_config")
    end,
  },
}

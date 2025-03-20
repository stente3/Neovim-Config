lvim.plugins = {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- Si prefieres usar nvim-web-devicons en lugar de mini.icons
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false, -- No usar carga diferida
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
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
    keys = (function()
      local keys = {
        -- Añadir un archivo actual a Harpoon
        {
          "<leader>a",
          function()
            require("harpoon.mark").add_file()
            vim.notify("Archivo añadido a Harpoon")
          end,
          desc = "Añadir archivo a Harpoon",
        },

        -- Abrir la interfaz de usuario de Harpoon
        {
          "<leader>m",
          function()
            require("harpoon.ui").toggle_quick_menu()
          end,
          desc = "Abrir menú de Harpoon",
        },

        -- Navegar al archivo siguiente en Harpoon
        {
          "<leader>l",
          function()
            require("harpoon.ui").nav_next()
          end,
          desc = "Archivo siguiente",
        },

        -- Navegar al archivo anterior en Harpoon
        {
          "<leader>h",
          function()
            require("harpoon.ui").nav_prev()
          end,
          desc = "Archivo anterior",
        },
      }

      -- Añadir navegación dinámica para <leader>1 a <leader>9
      for i = 1, 9 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon.ui").nav_file(i)
          end,
          desc = "Navegar al archivo " .. i,
        })
      end

      return keys
    end)(),
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",        -- Dependencia requerida por spectre
      "kyazdani42/nvim-web-devicons", -- Iconos (opcional pero recomendado)
    },
    config = function()
      -- Configuración de nvim-spectre
      require("spectre").setup({
        color_devicons = true,    -- Habilitar iconos de colores
        live_update = false,      -- Desactivar actualización en vivo (puedes cambiarlo a true si lo prefieres)
        highlight = {
          ui = "String",          -- Resaltado para la interfaz
          search = "DiffChange",  -- Resaltado para búsquedas
          replace = "DiffDelete", -- Resaltado para reemplazos
        },
      })
      -- Mapeos de teclas recomendados
      vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre",
      })
      vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word",
      })
      vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word",
      })
      vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search in current file",
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- Usa la configuración por defecto, puedes personalizarlo si lo deseas
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      }
    },
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
        split = "auto",     -- Puede ser 'auto', 'horizontal' o 'vertical'
        min_win_width = 80, -- Ancho mínimo para dividir la ventana automáticamente
      })

      -- Atajo para dividir la ventana verticalmente
      vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })
    end,
  },
}

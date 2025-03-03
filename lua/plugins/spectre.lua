return {
  -- Instalación de nvim-spectre y sus dependencias
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- Dependencia requerida por spectre
      "kyazdani42/nvim-web-devicons", -- Iconos (opcional pero recomendado)
    },
    config = function()
      -- Configuración básica de nvim-spectre
      require("spectre").setup({
        color_devicons = true,  -- Habilitar iconos de colores
        live_update = false,    -- Desactivar actualización en vivo (puedes cambiarlo a true si lo prefieres)
        highlight = {
          ui = "String",        -- Resaltado para la interfaz
          search = "DiffChange", -- Resaltado para búsquedas
          replace = "DiffDelete", -- Resaltado para reemplazos
        },
        mapping = {
          -- Mapeos personalizados (puedes agregar más según tus necesidades)
          ['toggle_line'] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle item"
          },
          ['enter_file'] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "open file"
          },
          ['send_to_qf'] = {
            map = "<leader>q",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all items to quickfix"
          },
          ['replace_cmd'] = {
            map = "<leader>c",
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = "input replace command"
          },
          ['run_replace'] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
          },
        },
      })

      -- Mapeos de teclas recomendados
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
      })
    end,
  },
}

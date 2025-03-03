return {
  -- Instalación de vim-illuminate
  {
    "RRethy/vim-illuminate",
    config = function()
      -- Configuración básica de vim-illuminate
      require('illuminate').configure({
        -- Proveedores para obtener referencias en el buffer (LSP, Tree-sitter, regex)
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        -- Retraso en milisegundos antes de resaltar
        delay = 100,
        -- Lista negra de tipos de archivo para no resaltar
        filetypes_denylist = {
          'dirbuf',
          'dirvish',
          'fugitive',
        },
        -- Resaltar bajo el cursor
        under_cursor = true,
        -- Número mínimo de coincidencias para resaltar
        min_count_to_highlight = 1,
      })

      -- Mapeos de teclas recomendados
      vim.keymap.set('n', '<a-n>', '<cmd>lua require("illuminate").goto_next_reference()<CR>', {
        desc = "Move to next reference"
      })
      vim.keymap.set('n', '<a-p>', '<cmd>lua require("illuminate").goto_prev_reference()<CR>', {
        desc = "Move to previous reference"
      })
      vim.keymap.set('n', '<a-i>', '<cmd>lua require("illuminate").textobj_select()<CR>', {
        desc = "Select reference as text object"
      })

      -- Personalización de grupos de resaltado
      vim.api.nvim_set_hl(0, 'IlluminatedWordText', { underline = true })
      vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { underline = true })
      vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { underline = true })
    end,
  },
}

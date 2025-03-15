return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      -- Configuración básica recomendada
      vim.o.foldcolumn = '0'         -- Mostrar una columna lateral para los plegados
      vim.o.foldlevel = 99           -- Asegúrate de que al abrir un archivo, todo esté desplegado
      vim.o.foldlevelstart = 99      -- Empieza con los plegados abiertos
      vim.o.foldenable = true        -- Habilitar plegado por defecto

      -- Atajos para abrir y cerrar todos los pliegues fácilmente
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Configuración usando Treesitter para markdown
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
    end
  }
}

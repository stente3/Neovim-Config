return {
  'nvim-telescope/telescope.nvim', -- Plugin de Telescope
  tag = '0.1.8', -- Especifica la versión exacta del plugin
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Dependencia necesaria para que Telescope funcione
  config = function()
    -- Intenta cargar Telescope, si falla, retorna sin ejecutar nada más
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    local actions = require "telescope.actions" -- Importa las acciones disponibles de Telescope

    telescope.setup {
      defaults = {
        -- Configuración predeterminada para Telescope
        prompt_prefix = " ", -- Prefijo del prompt (ícono de búsqueda)
        selection_caret = " ", -- Indicador de selección
        path_display = { "smart" }, -- Muestra rutas de forma inteligente

        mappings = {
          -- Atajos de teclado en el modo de inserción
          i = {
            ["<C-n>"] = actions.cycle_history_next, -- Siguiente en el historial
            ["<C-p>"] = actions.cycle_history_prev, -- Anterior en el historial

            ["<C-j>"] = actions.move_selection_next, -- Baja en la selección
            ["<C-k>"] = actions.move_selection_previous, -- Sube en la selección

            ["<C-c>"] = actions.close, -- Cierra Telescope
            ["<CR>"] = actions.select_default, -- Selecciona la opción por defecto
            ["<C-x>"] = actions.select_horizontal, -- Selecciona en un split horizontal
            ["<C-v>"] = actions.select_vertical, -- Selecciona en un split vertical
            ["<C-t>"] = actions.select_tab, -- Abre la selección en una nueva pestaña

            ["<C-u>"] = actions.preview_scrolling_up, -- Desplaza el preview hacia arriba
            ["<C-d>"] = actions.preview_scrolling_down, -- Desplaza el preview hacia abajo
          },

          -- Atajos de teclado en el modo normal
          n = {
            ["<esc>"] = actions.close, -- Cierra Telescope
            ["<CR>"] = actions.select_default, -- Selecciona la opción por defecto
            ["<C-x>"] = actions.select_horizontal, -- Selecciona en un split horizontal
            ["<C-v>"] = actions.select_vertical, -- Selecciona en un split vertical
            ["<C-t>"] = actions.select_tab, -- Abre la selección en una nueva pestaña

            ["j"] = actions.move_selection_next, -- Baja en la selección
            ["k"] = actions.move_selection_previous, -- Sube en la selección
          },
        },
      },
    }

    -- Atajos de teclado personalizados para usar Telescope
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' }) -- Busca entre las etiquetas de ayuda
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' }) -- Busca entre los mapas de teclas
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' }) -- Busca archivos
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' }) -- Lista las funcionalidades integradas
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' }) -- Busca la palabra bajo el cursor
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' }) -- Busca en texto dentro de archivos
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' }) -- Busca entre los diagnósticos del editor
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' }) -- Reanuda la última búsqueda
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' }) -- Muestra archivos recientes
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' }) -- Busca entre los buffers abiertos
  end,
}


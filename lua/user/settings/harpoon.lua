-- Cargar Harpoon
local harpoon = require("harpoon")

-- Configuración de Harpoon
harpoon.setup({
  menu = {
    width = 60, -- Ancho del menú de Harpoon
  },
})

-- Añadir un archivo actual a Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file() print("Archivo añadido a Harpoon")<CR>', { noremap = true, silent = true })

-- Abrir la interfaz de usuario de Harpoon
vim.api.nvim_set_keymap('n', '<leader>m', ':lua require("harpoon.ui").toggle_quick_menu() print("Menú de Harpoon abierto")<CR>', { noremap = true, silent = true })

-- Navegar a los archivos marcados
for i = 1, 4 do
  vim.api.nvim_set_keymap('n', '<leader>' .. i, ':lua require("harpoon.ui").nav_file(' .. i .. ') print("Navegando al archivo ' .. i .. '")<CR>', { noremap = true, silent = true })
end

-- Navegar al archivo siguiente en Harpoon
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("harpoon.ui").nav_next() print("Navegando al archivo siguiente en Harpoon")<CR>', { noremap = true, silent = true })

-- Navegar al archivo anterior en Harpoon
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").nav_prev() print("Navegando al archivo anterior en Harpoon")<CR>', { noremap = true, silent = true })


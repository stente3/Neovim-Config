return {
  "zk-org/zk-nvim",
  config = function()
    -- Configuración básica de zk-nvim
    require("zk").setup({
      picker = "telescope",  -- Usar Telescope como selector de notas
      lsp = {
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },  -- Activar LSP para archivos Markdown
        },
      },
    })

    -- Mapeos de teclas y funciones personalizadas
    local opts = { noremap = true, silent = true }

    -- Abrir notas recientes
    vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)

    -- Buscar notas por etiquetas
    vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

    -- Buscar notas enlazadas (backlinks)
    vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)

    -- Buscar notas enlazadas por la actual
    vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

    -- Función para obtener un timestamp con formato "%Y%m%d%H%M"
    function GetTimestamp()
      return os.date("%Y%m%d%H%M")
    end

    -- Función para generar el nombre del archivo con el timestamp y el título dado por el usuario
    function GenerateFilename(title)
      local timestamp = GetTimestamp()
      return timestamp .. "-" .. title:gsub(" ", "_") .. ".md"  -- Reemplaza espacios con guiones bajos
    end

    -- Función para crear una nota en una carpeta específica
    function CreateNoteInDirectory(directory)
      local title = vim.fn.input("Nombre de la nota: " .. directory)
      if title == "" then
        print("❌ No se creó la nota. Se requiere un nombre.")
        return
      end

      local filename = GenerateFilename(title)
      local path = vim.fn.expand("~/Documents/Zettelkasten/" .. directory .. "/" .. filename)

      vim.cmd("edit " .. path)  -- Abre el archivo en Neovim
    end

    -- Crear comandos personalizados para cada carpeta
    vim.api.nvim_create_user_command("ZkInbox", function() CreateNoteInDirectory("inbox") end, {})
    vim.api.nvim_create_user_command("ZkIndex", function() CreateNoteInDirectory("index") end, {})
    vim.api.nvim_create_user_command("ZkMyNotes", function() CreateNoteInDirectory("notes") end, {})
    vim.api.nvim_create_user_command("ZkReferences", function() CreateNoteInDirectory("references") end, {})

    -- Mapear teclas para crear notas en cada carpeta
    vim.api.nvim_set_keymap("n", "<leader>zi", "<Cmd>ZkInbox<CR>", opts)    -- Crea una nota en inbox
    vim.api.nvim_set_keymap("n", "<leader>zI", "<Cmd>ZkIndex<CR>", opts)    -- Crea una nota en index
    vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkMyNotes<CR>", opts)  -- Crea una nota en notes
    vim.api.nvim_set_keymap("n", "<leader>zr", "<Cmd>ZkReferences<CR>", opts) -- Crea una nota en references
  end,
}

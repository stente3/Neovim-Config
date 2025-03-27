lvim.builtin.which_key.mappings["t"] = {
  w = {
    function()
      vim.o.wrap = not vim.o.wrap
      vim.notify("Wrap is now " .. (vim.o.wrap and "ON" or "OFF"))
    end,
    "Toggle Wrap",
  },
}

-- PLUGINS KEYMAPS

---------
-- OIL --
---------
lvim.keys.normal_mode["-"] = "<CMD>Oil<CR>"

-------------
-- HARPOON --
-------------
lvim.builtin.which_key.mappings["h"] = {
  name = "Harpoon",
  a = {
    function()
      require("harpoon.mark").add_file()
      vim.notify("Archivo añadido a Harpoon")
    end,
    "Añadir archivo",
  },
  m = {
    function()
      require("harpoon.ui").toggle_quick_menu()
    end,
    "Menú de Harpoon",
  },
  n = {
    function()
      require("harpoon.ui").nav_next()
    end,
    "Siguiente archivo",
  },
  b = {
    function()
      require("harpoon.ui").nav_prev()
    end,
    "Anterior archivo",
  },
}

-- Navegación directa a archivos marcados con <leader>1 hasta <leader>9
for i = 1, 9 do
  lvim.builtin.which_key.mappings[tostring(i)] = {
    function()
      require("harpoon.ui").nav_file(i)
    end,
    "Navegar al archivo " .. i,
  }
end

-------------
-- TROUBLE -- 
-------------
lvim.builtin.which_key.mappings["xx"] = {
  "<cmd>Trouble diagnostics toggle<cr>",
  "Diagnostics (Trouble)",
}

---------------
-- AUTOSPLIT --
---------------
lvim.builtin.which_key.mappings["w"] = {
  name = "Window",
  v = { "<cmd>vsplit<CR>", "Vertical Split" },
  h = { "<cmd>split<CR>", "Horizontal Split" },
}

--------------
-- OBSIDIAN --
--------------
-- Función para timestamp
local function GetTimestamp()
  return os.date("%Y%m%d%H%M")
end

-- Generar nombre de archivo
local function GenerateFilename(title)
  local timestamp = GetTimestamp()
  return timestamp .. "-" .. title:gsub(" ", "_") .. ".md"
end

-- Crear una nota
local function CreateObsidianNote()
  local directories = { "index", "inbox", "notes", "references" }

  local choice = vim.fn.inputlist({
    "Seleccione el directorio:",
    "1. index",
    "2. inbox",
    "3. notes",
    "4. references"
  })

  if choice < 1 or choice > #directories then
    print("❌ Selección inválida. No se creó la nota.")
    return
  end

  local title = vim.fn.input("Nombre de la nota: ")
  if title == "" then
    print("❌ No se creó la nota. Se requiere un nombre.")
    return
  end

  local directory = directories[choice]
  local filename = GenerateFilename(title)
  local fullpath = "~/Documents/Zettelkasten/" .. directory .. "/" .. filename
  vim.cmd("edit " .. fullpath)
end

-- Comando para usar en Neovim
vim.api.nvim_create_user_command("ObsidianCreateNote", CreateObsidianNote, {})

-- Keymap al estilo LunarVim
lvim.builtin.which_key.mappings["o"] = {
  name = "Obsidian",
  n = { "<cmd>ObsidianCreateNote<CR>", "Crear nueva nota" },
}


local function GetTimestamp()
  return os.date("%Y%m%d%H%M")
end

local function GenerateFilename(title)
  local timestamp = GetTimestamp()
  return timestamp .. "-" .. title:gsub(" ", "_") .. ".md" -- Reemplaza espacios con guiones bajos y añade la extensión
end

local function CreateObsidianNote()
  -- Lista de carpetas predefinidas
  local directories = {
    "index",
    "inbox",
    "notes",
    "references"
  }

  -- Mostrar lista de opciones al usuario
  local choice = vim.fn.inputlist({
    "Seleccione el directorio:",
    "1. index",
    "2. inbox",
    "3. notes",
    "4. references"
  })

  -- Validar elección
  if choice < 1 or choice > #directories then
    print("❌ Selección inválida. No se creó la nota.")
    return
  end

  local directory = directories[choice]

  -- Solicita el título de la nota
  local title = vim.fn.input("Nombre de la nota: ")
  if title == "" then
    print("❌ No se creó la nota. Se requiere un nombre.")
    return
  end

  local filename = GenerateFilename(title)
  local fullpath = "~/Documents/Zettelkasten/" .. directory .. "/" .. filename

  -- Crea la nota en la ubicación correcta
  vim.cmd("edit " .. fullpath)
end

vim.api.nvim_create_user_command("ObsidianCreateNote", CreateObsidianNote, {})
vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianCreateNote<CR>", { noremap = true, silent = true })

return {
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
    opts = {
      workspaces = {
        { name = "personal", path = "~/Documents/Zettelkasten" },
      },
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily-notes" },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      preferred_link_style = "wiki",
      wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
      end,
      picker = {
        name = "telescope.nvim",
        note_mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
      },
      attachments = {
        img_folder = "assets/imgs",
        img_name_func = function()
          return string.format("%s-", os.time())
        end,
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      -- templates = {
      --   folder = "templates",
      --   date_format = "%Y-%m-%d",
      --   time_format = "%H:%M",
      -- },
      ui = {
        enable = false,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
        bullets = { char = "•", hl_group = "ObsidianBullet" },
      },
    },
  }
}

local obsidian = require("obsidian")

obsidian.setup({
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
  ui = {
    enable = false,
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
    },
    bullets = { char = "•", hl_group = "ObsidianBullet" },
  },
})

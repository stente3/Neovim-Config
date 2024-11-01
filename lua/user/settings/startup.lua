require"startup".setup({
  theme = "evil",
  layout = {
    { type = "padding", val = 4 },  -- Aumenta el padding inicial
    { type = "text", align = "center", content = {
        "_____       _      _    _ ",
        "| ____|_   _| | ___| | _| |",
        "|  _| \\ \\ / / |/ _ \\ |/ / |",
        "| |___ \\ V /| |  __/   <|_|",
        "|_____| \\_/ |_|\\___|_|\\_(_)"
      }, highlight = "Statement" },
    { type = "padding", val = 2 },  -- Espacio adicional entre el header y los botones
    { type = "buttons", val = {
        { "e", "  New file", ":enew<CR>" },
        { "f", "  Find file", ":Telescope find_files<CR>" },
        { "r", "  Recent files", ":Telescope oldfiles<CR>" },
        { "q", "  Quit", ":qa<CR>" },
      } 
    },
    { type = "padding", val = 2 },
    { type = "text", align = "center", content = {"Welcome to Neovim"}, highlight = "Number" }
  }
})


return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000, -- duración de la notificación en ms
      background_colour = "#000000",
      render = "default",
    })

    vim.notify = require("notify") -- establece notify como notificador por defecto de Neovim
  end,
}

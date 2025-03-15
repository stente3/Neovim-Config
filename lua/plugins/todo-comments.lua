return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Dependencia requerida
  event = "VeryLazy", -- Cargar solo cuando sea necesario
  config = function()
    require("todo-comments").setup({
      keywords = {
        TODO = { icon = " ", color = "info" },
        FIX = { icon = " ", color = "error" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        NOTE = { icon = " ", color = "hint" },
      },
      highlight = {
        before = "", -- No agregar texto antes del resaltado
        keyword = "wide", -- Resalta toda la palabra
        after = "fg", -- Resalta el texto después del TODO
      },
      search = {
        command = "rg", -- Usa `ripgrep` para la búsqueda
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
      },
    })
  end,
}

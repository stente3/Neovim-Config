return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- Instala dependencia
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/Documents/Zettelkasten/"), -- Ruta de las notas
    })
  end,
}

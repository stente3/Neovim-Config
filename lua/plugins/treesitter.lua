---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "html",
      "css",
      "typescript",
      "java",
      "markdown",
      "python",
      "json",
      -- add more arguments for adding more treesitter parsers
    },
    highlight = {
      enable = true,  -- Activa el resaltado de sintaxis
      additional_vim_regex_highlighting = false,
    }
  },
}

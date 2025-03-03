return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_chat = true,
      enable_cmp_source = true,
      virtual_text = {
        enabled = true,
        default_filetype_enabled = true,
      },
      workspace_root = {
        use_lsp = true,
        paths = { ".git", "package.json" },
      },
    })
  end,
}

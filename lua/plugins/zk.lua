return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",

      lsp = {
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fd",
      function()
        require("telescope.builtin").find_files({ cwd = "~/Documents/Life" })
      end,
      desc = "Find Files in Directory",
    },
  },
}

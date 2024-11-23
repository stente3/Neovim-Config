vim.cmd [[colorscheme kanagawa-dragon]]

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.undofile = true
opt.smoothscroll = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require "berkinkara.plugins.colorscheme",
  require "berkinkara.plugins.comment",
  require "berkinkara.plugins.completion",
  require "berkinkara.plugins.dap",
  require "berkinkara.plugins.formatter",
  require "berkinkara.plugins.gitsigns",
  require "berkinkara.plugins.linter",
  require "berkinkara.plugins.lsp",
  require "berkinkara.plugins.lualine",
  require "berkinkara.plugins.mini",
  require "berkinkara.plugins.neotest",
  require "berkinkara.plugins.telescope",
  require "berkinkara.plugins.todo-comments",
  require "berkinkara.plugins.trouble",
  require "berkinkara.plugins.treesitter",
  require "berkinkara.plugins.vim-tmux-navigator",
  require "berkinkara.plugins.which-key",
})

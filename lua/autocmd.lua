local general = vim.api.nvim_create_augroup('General', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'o' }
  end,
  group = general,
  desc = 'Turn off the stupid autocommenting',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

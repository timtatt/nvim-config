local general = vim.api.nvim_create_augroup("General", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  group = general,
  desc = "Turn off the stupid autocommenting",
})

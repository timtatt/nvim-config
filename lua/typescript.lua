local M = {}

M.organize_imports = function()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
    opts = {},
    async = false,
  }

  vim.lsp.buf.execute_command(params)
end

return M

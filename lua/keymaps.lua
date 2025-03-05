-- Resizing windows
vim.keymap.set({ 'n', 'v' }, '<M-.>', '<C-W>5>', { desc = 'Increase width by 5' })
vim.keymap.set({ 'n', 'v' }, '<M-,>', '<C-W>5<', { desc = 'Decrease width by 5' })

-- Moving between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Clipboarding
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard below' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste from clipboard above' })
vim.keymap.set({ 'n', 'v' }, 'y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', 'Y', '"+y$', { desc = 'Yank to clipboard' })

-- Navigating wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Alternate File
vim.keymap.set('n', '<C-E>', ':e#<CR>', { desc = 'Go to alternate file' })

-- QuickFix
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next item in QuickFix list' })
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Prev item in QuickFix list' })
vim.keymap.set('n', '<leader>qo', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Close quickfix list' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Open [D]iagnostic in [Q]uickfix list' })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

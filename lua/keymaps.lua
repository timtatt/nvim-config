-- Resizing windows
vim.keymap.set({ 'n', 'v' }, '<M-,>', '<C-W>5<', { desc = 'Decrease width by 5' })
vim.keymap.set({ 'n', 'v' }, '<M-.>', '<C-W>5>', { desc = 'Increase width by 5' })

-- Moving between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Indenting
vim.keymap.set('i', '<S-Tab>', '<C-d>')
vim.keymap.set('v', '<', '<gv', { desc = 'Dedent selection and keep highlighting' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection and keep highlighting' })

-- Clipboarding
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard below' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste from clipboard above' })
vim.keymap.set({ 'n', 'v' }, 'y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', 'Y', '"+y$', { desc = 'Yank to clipboard' })

-- Commenting
-- vim.keymap.set({'i', 'n'}, '<C-/>', 

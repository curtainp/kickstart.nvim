return {
  'michaelb/sniprun',
  build = 'sh install.sh 1', -- compile locally
  config = function()
    require('sniprun').setup {}
    -- keymap
    vim.keymap.set('n', '<leader>rr', '<Plug>SnipRun', { desc = '[R]un Line' })
    vim.keymap.set('v', '<leader>rr', '<Plug>SnipRun', { desc = '[R]un Block' })
    vim.keymap.set('n', '<leader>rs', '<Plug>SnipReset', { desc = '[R]un re[S]et' })
    vim.keymap.set('n', '<leader>rc', '<Plug>SnipClose', { desc = '[R]un [C]lose' })
  end,
}

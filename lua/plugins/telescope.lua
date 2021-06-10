local set_keymap = require('../util').set_keymap
set_keymap(
    'n',
    '<c-p>',
    '<cmd>Telescope find_files<cr>'
)

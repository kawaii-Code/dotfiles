local telescope = require('telescope')

local keymap = require('config.keymap')

telescope.setup({
    defaults = {
        mappings = keymap.telescope_mappings,
        file_ignore_patterns = {
            'bin',
            'obj',
            'dependencies',
            'vendor'
        },
    }
})

local function bootstrap()
    vim.g.mapleader = ' '

    require('config.plugins.lazy')

    require('config.options')
    require('config.keymap')
    require('config.colorscheme')
    require('config.orgmode')
    require('config.other')

    require('config.plugins.cmp')
    require('config.plugins.lspconfig')
    require('config.plugins.telescope')
end

bootstrap()

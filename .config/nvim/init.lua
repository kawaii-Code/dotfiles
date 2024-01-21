local options = vim.opt
local map = vim.keymap

vim.g.mapleader = ' '

options.termguicolors = true
options.fileencodings = 'ucs-bom,utf-8,cp1251,default,latin1'
options.langmap = 'йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:\'"zZxXcCvVbBnNmM\\,<.>?'

options.mouse = 'a'
options.number = true
options.relativenumber = true
options.list = true
options.listchars = {tab='» ', space='·'}
options.wrap = false
options.scrolloff = 8
options.colorcolumn = '80'

local spaces = 4
options.tabstop = spaces
options.shiftwidth = spaces
options.expandtab = true

vim.cmd.colorscheme('fabrique')

map.set('i', '"', '""<ESC>i')
map.set('i', '[', '[]<ESC>i')
map.set('i', '{', '{}<ESC>i')
map.set('n', '>', '>>')
map.set('n', '<', '<<')
map.set('n', '<leader>h', '<CMD>nohlsearch<CR>')
map.set('n', '<leader>d', vim.diagnostic.open_float)
map.set('n', '<leader>dn', vim.diagnostic.goto_next)
map.set('n', '<leader>dp', vim.diagnostic.goto_prev)


--
-- Plugins
--


local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})
Plug 'ThePrimeagen/harpoon'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug('L3MON4D3/LuaSnip', {['do'] = 'make install_jsregexp'})

vim.call('plug#end')

local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-h>'] = 'which_key',
                ['<Esc>'] = actions.close,
            },
        },
        file_ignore_patterns = {
            'bin',
            'obj',
            'dependencies',
            'vendor'
        },
    }
})
local function telescope_project_files()
    local opts = {}
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        require('telescope.builtin').git_files(opts)
    else
        require('telescope.builtin').find_files(opts)
    end
end
map.set('n', '<leader>f', telescope_project_files)
map.set('n', '<leader>st', require('telescope.builtin').live_grep)

local harpoonMark = require('harpoon.mark')
local harpoonUi = require('harpoon.ui')
map.set('n', '<leader>a', harpoonMark.add_file)
map.set('n', '<leader>g', harpoonUi.toggle_quick_menu)
map.set('n', '<leader>1', function() harpoonUi.nav_file(1) end)
map.set('n', '<leader>2', function() harpoonUi.nav_file(2) end)
map.set('n', '<leader>3', function() harpoonUi.nav_file(3) end)
map.set('n', '<leader>4', function() harpoonUi.nav_file(4) end)
map.set('n', '<leader>5', function() harpoonUi.nav_file(5) end)
map.set('n', '<leader>6', function() harpoonUi.nav_file(6) end)
map.set('n', '<leader>7', function() harpoonUi.nav_file(7) end)
map.set('n', '<leader>8', function() harpoonUi.nav_file(8) end)
map.set('n', '<leader>9', function() harpoonUi.nav_file(9) end)
map.set('n', '<leader>0', function() harpoonUi.nav_file(10) end)


--
-- LSP
--


local lspconfig = require('lspconfig')

local function on_attach(event)
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local options = {buffer = event.buf}
    map.set('n', 'gd', vim.lsp.buf.definition, options)
    map.set('n', 'gD', vim.lsp.buf.declaration, options)
    map.set('n', 'gi', vim.lsp.buf.implementation, options)
    map.set('n', 'gr', vim.lsp.buf.references, options)
    map.set('n', 'K', vim.lsp.buf.hover, options)
    map.set('n', '<leader>K', vim.lsp.buf.signature_help, options)
    map.set('n', '<leader>lr', vim.lsp.buf.rename, options)
    map.set({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, options)
end

local group = vim.api.nvim_create_augroup('UserLspConfig', {})
vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    callback = on_attach,
})

lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.lua_ls.setup({})

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = { '*.go' },
    callback = function()
        options.tabstop = 4
        options.shiftwidth = 4
        options.expandtab = false
    end,
})

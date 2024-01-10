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

vim.cmd.colorscheme('kawaii')    

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
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})
Plug 'ThePrimeagen/harpoon'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug('L3MON4D3/LuaSnip', {['do'] = 'make install_jsregexp'})

vim.call('plug#end')

local telescope_builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local function telescope_project_files()
    local opts = {}
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        require('telescope.builtin').git_files(opts)
    else
        require('telescope.builtin').find_files(opts)
    end
end
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
map.set('n', '<leader>f', telescope_project_files)
map.set('n', '<leader>st', telescope_builtin.live_grep)

local harpoonMark = require('harpoon.mark')
local harpoonUi = require('harpoon.ui')
map.set('n', '<leader>a', harpoonMark.add_file)
map.set('n', '<C-j>', function() harpoonUi.nav_file(1) end)
map.set('n', '<C-k>', function() harpoonUi.nav_file(2) end)
map.set('n', '<C-l>', function() harpoonUi.nav_file(3) end)
map.set('n', '<leader>g', harpoonUi.toggle_quick_menu)


--
-- LSP
--


local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function on_attach(event)
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local options = {buffer = event.buf}
    map.set('n', 'gd', vim.lsp.buf.definition, options)
    map.set('n', 'gi', vim.lsp.buf.implementation, options)
    map.set('n', 'gr', vim.lsp.buf.references, options)
    map.set('n', 'gD', vim.lsp.buf.declaration, options)
    map.set('n', '<leader>D', vim.lsp.buf.type_definition, options)
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

lspconfig.clangd.setup({capabilities = capabilities})
lspconfig.rust_analyzer.setup({capabilities = capabilities})
lspconfig.pyright.setup({capabilities = capabilities})
lspconfig.gopls.setup({capabilities = capabilities})
lspconfig.zls.setup({capabilities = capabilities})
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {Lua = {telemetry = {enable = false}}},
})

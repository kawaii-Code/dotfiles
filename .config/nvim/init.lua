-- Import options from Vim
vim.cmd.source('~/.vimrc')

-- Some overrides for Neovim
local options = vim.opt
options.listchars = {tab='» ', space='·'}

-- Better than retrobox 😳
vim.cmd.colorscheme('fabrique')

-- This doesn't work in Vim
-- nnoremap <C-CR> o<ESC>
-- nnoremap <C-S-CR> O<ESC>

local map = vim.keymap
map.set('n', '<leader>d', vim.diagnostic.open_float)
map.set('n', '<leader>dn', vim.diagnostic.goto_next)
map.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.diagnostic.disable()

-- Plugin options
vim.cmd('let g:sneak#use_ic_scs = 1')
vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd('let g:ultisnipsExpandTrigger="<tab>"')
vim.cmd('let g:ultisnipsJumpForwardTrigger="<c-b>"')
vim.cmd('let g:ultisnipsJumpBackwardTrigger="<c-z>"')

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})
Plug 'ThePrimeagen/harpoon'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'

Plug 'lervag/vimtex'

Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-expand-region'

vim.call('plug#end')

-- Plugins

vim.cmd.highlight('link Sneak IncSearch')

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.select_default,
                ['<Esc>'] = actions.close,
            },
        },
        file_ignore_patterns = {
            '.git/',
            'bin/',
            'build/',
            'lib/',
        },
    },
}
map.set('n', '<leader>f', function() builtin.fd { follow = true } end)
map.set('n', '<leader>st', builtin.live_grep)

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
map.set('n', '<leader>a', mark.add_file)
map.set('n', '<leader>g', ui.toggle_quick_menu)
map.set('n', '<leader>1', function() ui.nav_file(1) end)
map.set('n', '<leader>2', function() ui.nav_file(2) end)
map.set('n', '<leader>3', function() ui.nav_file(3) end)
map.set('n', '<leader>4', function() ui.nav_file(4) end)
map.set('n', '<leader>5', function() ui.nav_file(5) end)
map.set('n', '<leader>6', function() ui.nav_file(6) end)
map.set('n', '<leader>7', function() ui.nav_file(7) end)
map.set('n', '<leader>8', function() ui.nav_file(8) end)
map.set('n', '<leader>9', function() ui.nav_file(9) end)
map.set('n', '<leader>0', function() ui.nav_file(10) end)

local cmp = require('cmp')
cmp.setup {
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-n>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
    }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
local function on_attach(event)
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local options = {buffer = event.buf}
    map.set('n', 'gd', vim.lsp.buf.definition, options)
    map.set('n', 'gD', vim.lsp.buf.declaration, options)
    map.set('n', 'gi', vim.lsp.buf.implementation, options)
    map.set('n', 'gr', vim.lsp.buf.references, options)
    map.set('n', '<F1>', vim.lsp.buf.hover, options)
    map.set('n', '<leader>lr', vim.lsp.buf.rename, options)
    map.set({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, options)
end
vim.api.nvim_create_autocmd('LspAttach', {
    callback = on_attach,
})

lspconfig.lua_ls.setup {capabilities = capabilities}
lspconfig.clangd.setup {capabilities = capabilities}
lspconfig.gopls.setup {capabilities = capabilities}
lspconfig.zls.setup {capabilities = capabilities}

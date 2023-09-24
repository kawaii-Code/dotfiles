local keymap = {}

local map = vim.keymap

map.set('n', '>', '>>')
map.set('n', '<', '<<')

map.set('n', '<leader>g', '<CMD>nohlsearch<CR>')

map.set('n', '<leader>d', vim.diagnostic.open_float)
map.set('n', '<leader>dn', vim.diagnostic.goto_next)
map.set('n', '<leader>dp', vim.diagnostic.goto_prev)

local telescope = require('telescope.builtin')
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
keymap.telescope_mappings = {
    i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-h>'] = 'which_key',
        ['<Esc>'] = actions.close,
    },
}
map.set('n', '<leader>f', telescope_project_files)
map.set('n', '<leader>st', telescope.live_grep)

function keymap.set_lsp_mappings(options)
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

function keymap.set_cmp_mappings(cmp, luasnip)
    return {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
        }),
    }
end

local harpoonMark = require('harpoon.mark')
local harpoonUi = require('harpoon.ui')
map.set('n', '<leader>a', harpoonMark.add_file)
map.set('n', '<C-j>', function() harpoonUi.nav_file(1) end)
map.set('n', '<C-k>', function() harpoonUi.nav_file(2) end)
map.set('n', '<C-l>', function() harpoonUi.nav_file(3) end)
map.set('n', '<leader>h', harpoonUi.toggle_quick_menu)

return keymap

local ORG_TEXT_WIDTH = 120
local options = require('config.options')

local function enter_org_mode()
    options.textwidth = ORG_TEXT_WIDTH
    options.colorcolumn = ''

    options.set_tab_size(3)
end

local group = vim.api.nvim_create_augroup('Org', {})
vim.api.nvim_create_autocmd('BufEnter', {
        group = group,
        pattern = {'*.org'},
        callback = enter_org_mode,
    }
)

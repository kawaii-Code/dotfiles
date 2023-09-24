local options = vim.opt

options.fileencodings = 'ucs-bom,utf-8,cp1251,default,latin1'
options.termguicolors = true

options.langmap = 'йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:\'"zZxXcCvVbBnNmM\\,<.>?'

options.number = true
options.relativenumber = true

-- Show tabs and trailing whitespace
options.list = true
options.listchars = {tab='\\ \\', trail='`'}

options.wrap = false

options.mouse = 'a'

options.scrolloff = 8
options.colorcolumn = '80'

options.foldmethod = 'indent'
options.foldlevel = 8

local function set_tab_size(spaces)
    options.tabstop = spaces
    options.shiftwidth = spaces
    options.expandtab = true
end

set_tab_size(4)

local M = {}
local mt = {
    __index = function(table, key)
        if key == 'set_tab_size' then
            return set_tab_size
        end
        return options[key]
    end,
}
setmetatable(M, mt)
return M

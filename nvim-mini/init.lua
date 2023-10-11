local options = vim.opt
local keymap = vim.keymap

options.mouse = 'a'
options.fileencodings = 'ucs-bom,utf-8,cp1251,default,latin1'
options.termguicolors = true

local spaces = 4
options.tabstop = spaces
options.shiftwidth = spaces
options.expandtab = true

options.number = true
options.relativenumber = true
options.colorcolumn = '80'
options.scrolloff = 8
options.wrap = false
options.list = true
options.listchars = {tab='> ', trail='`'}

vim.g.mapleader = ' '
keymap.set('n', '>', '>>')
keymap.set('n', '<', '<<')
keymap.set('n', '<leader>h', '<CMD>nohlsearch<CR>')

vim.cmd.colorscheme('koehler')

return {
    'nvim-lua/plenary.nvim',

    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {'L3MON4D3/LuaSnip', build = 'make install_jsregexp'},

    'ThePrimeagen/harpoon',
    'jiangmiao/auto-pairs',
    'tpope/vim-surround',

    'savq/melange-nvim',
}


return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    use "daschw/leaf.nvim"
    use "racagogi/mytilus"
    use "holidaycereal/alena.nvim"
    use "holidaycereal/notation.nvim"
    use "gmr458/cold.nvim"
    use 'gwh-dev/concoctis.nvim'
    use 'mbbill/desertEx'
    use 'rose-pine/neovim'
    use 'morhetz/gruvbox'
    use 'doums/darcula'
    use 'tomasiser/vim-code-dark'
    use 'lifepillar/vim-solarized8'
    use "nikolvs/vim-sunbather"
    use "t184256/vim-boring"
    use "jaredgorski/fogbell.vim"
    use "stefanvanburen/rams.vim"

    -- use 'github/copilot.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'preservim/nerdtree'
    use 'neovimhaskell/haskell-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'DingDean/wgsl.vim'
    use 'alaviss/nim.nvim'
    use 'tpope/vim-dispatch'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'zefei/vim-colortuner'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sbdchd/neoformat'
    use 'maxmellon/vim-jsx-pretty'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'ntpeters/vim-better-whitespace'
    use 'windwp/nvim-autopairs'
    use 'preservim/vimux'
    use 'tpope/vim-fugitive'
    use 'editorconfig/editorconfig-vim'
    use 'gzagatti/vim-leuven-theme'
    use 'relastle/bluewery.vim'
    use 'NLKNguyen/papercolor-theme'
    use 'savq/melange'
  end)


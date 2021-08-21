-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'Th3Whit3Wolf/one-nvim',
    run = ':colorscheme one-nvim'
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use 'lukas-reineke/indent-blankline.nvim'

end)


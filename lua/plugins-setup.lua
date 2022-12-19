local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim on save (this file)
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')

  -- Theme
  use('bluz71/vim-nightfly-guicolors')

  -- Tmux & window navigation
  use('christoomey/vim-tmux-navigator')
  use('szw/vim-maximizer')

  -- Essentials
  use('tpope/vim-surround') -- Surrond like vs-code
  use('vim-scripts/ReplaceWithRegister') -- Use register for replacement grw
  use('numToStr/Comment.nvim') -- Comment line
  use('kyazdani42/nvim-web-devicons') -- Icons
  
  -- Lualine
  use('nvim-lualine/lualine.nvim')

  -- Telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
  use('nvim-telescope/telescope-file-browser.nvim') -- Better view
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

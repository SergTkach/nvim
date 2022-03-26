local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	 print('Cloning packer..')
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost load_plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local answer, packer = pcall(require, "packer")
if not answer then
  error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
    return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {
      	border = "rounded"
      }
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 800, -- Timeout, in seconds
  },
  compile_path = vim.fn.stdpath('config') .. '/lua/lazynvim/compiled.lua',
  auto_clean = true,
  compile_on_sync = true,
}


local plugins = {
  {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  },

  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end,
  },


  {
    "nathom/filetype.nvim",
    config = function()
      vim.g.did_load_filetypes = 1
    end,
  },

  {
    'nvim-lua/plenary.nvim',
  },

  {
    'marko-cerovac/material.nvim'
  }




}





return packer.startup(function(use)
   for _, called_plugin in pairs(plugins) do
      use(called_plugin)
   end
end)

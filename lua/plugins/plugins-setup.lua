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

local packer_bootstrap = ensure_packer()
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons',opt = true}
  }
  use {
    'nvim-tree/nvim-tree.lua', --文档树
   requires = {
      'nvim-tree/nvim-web-devicons', --文档树图标
    }
  }
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
  use {"christoomey/vim-tmux-navigator"} --用ctl-hjkl来定位窗口
  use {"nvim-treesitter/nvim-treesitter"} -- 语法高亮
  use {"p00f/nvim-ts-rainbow"} -- 配合treesitter,不同括号颜色区分
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",--mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
  use ("hrsh7th/nvim-cmp")
  use ("hrsh7th/cmp-nvim-lsp")
  use ("L3MON4D3/LuaSnip") --snippets引擎，不装这个自动补全会出问题
  use ("saadparwaiz1/cmp_luasnip")
  use ("rafamadriz/friendly-snippets")
  use ("hrsh7th/cmp-path")--文件路经

  use "numToStr/Comment.nvim" --gcc和gc注释
  use "windwp/nvim-autopairs" --自动补全括号

  use "akinsho/bufferline.nvim" --buffer分割线
  use "lewis6991/gitsigns.nvim" --左侧git提示
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 if packer_bootstrap then
    require('packer').sync()
  end
end)

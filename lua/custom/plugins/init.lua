--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-sleuth',
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = {
      'BufNewFile G:/My Drive/Kintsugi/*.md',
      'BufReadPre G:/My Drive/Kintsugi/*.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'kintsugi',
          path = 'G:/My Drive/Kintsugi',
        },
      },
    },
  },
}

--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-sleuth',

  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'blink.cmp',
      -- 'hrsh7th/nvim-cmp',
      'folke/snacks.nvim',
      -- 'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      workspaces = {
        {
          name = 'kintsugi',
          path = 'G:/My Drive/Kintsugi',
        },
        {
          name = 'kintsugi',
          path = 'C:/Users/scott/My Drive/Kintsugi',
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      },
      picker = {
        name = 'snacks.pick',
      },
      follow_url_func = function(url)
        vim.cmd(':silent exec "!start ' .. url .. '"')
        vim.ui.open(url)
      end,
      -- I tried to make the for loop sort all the properties alphabetically
      -- but it removes all the properties with no value in the key-value pair.
      -- Instead I've just disabled the frontmatter handling for the current
      -- moment.
      -- Furthermore, adding the config = function() in addition to opts = {}
      -- causes the opts to seemingly be overriden.
      disable_frontmatter = true,
      ---@return table
      note_frontmatter_func = function(note)
        -- sets the note title as alias
        if note.title then
          note:add_alias(note.title)
        end
        local out = {}
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        else
          out = { id = note.id, aliases = note.aliases, tags = note.tags }
        end
        return out
      end,
    },
    -- config = function()
    --   vim.opt.conceallevel = 2
    -- end,
  },
}

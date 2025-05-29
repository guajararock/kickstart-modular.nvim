return {
  -- If you want neo-tree's file operations to work with LSP (updating imports, etc.), you can use a plugin like
  -- https://github.com/antosha417/nvim-lsp-file-operations:
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      { '3rd/image.nvim', opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker', -- for open_with_window_picker keymaps
        version = '2.*',
        config = function()
          require('window-picker').setup {
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', 'quickfix' },
              },
            },
          }
        end,
      },
    },
    lazy = false, -- Carga al iniciar Neovim
    config = function()
      require('neo-tree').setup {
        close_if_last_window = false,
        enable_git_status = true,
        enable_diagnostics = true,
        popup_border_style = 'rounded',
        source_selector = {
          winbar = true,
          statusline = false,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = true,
            hide_gitignored = true,
          },
        },
      }

      vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Open Neo-tree' })
    end,
  },
}

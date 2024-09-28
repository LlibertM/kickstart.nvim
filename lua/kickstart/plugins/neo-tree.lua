-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    -- { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<Leader>e', ':Neotree toggle<CR>', desc = 'Toggle [E]xplorer', silent = true },
    {
      '<Leader>o',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      desc = 'Toggle Explorer Focus',
    },
  },
  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    sources = { 'filesystem', 'buffers', 'git_status' },
    source_selector = {
      winbar = true,
      content_layout = 'center',
      sources = {
        { source = 'filesystem', display_name = 'File' },
        { source = 'buffers', display_name = 'Bufs' },
        { source = 'git_status', display_name = 'Git' },
        { source = 'diagnostics', display_name = 'Diagnostic' },
      },
    },
    window = {
      width = 30,
    },
    filesystem = {
      filtered_items = {
        visible = false,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          '.gitignore',
        },
        never_show = {
          '.git',
          '.github',
          '.DS_Store',
          '.thumbs.db',
        },
      },
    },
  },
}

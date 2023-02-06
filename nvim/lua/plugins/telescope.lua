local map = vim.keymap.set
local builtin = require('telescope.builtin')

map('n', '<leader>mf', builtin.find_files, {})
map('n', '<leader>mg', builtin.git_files, {})
map('n', '<leader>mb', builtin.buffers, {})
map('n', '<leader>a', builtin.live_grep, {})
map('n', '<leader>za', builtin.grep_string, {})
-- map('n', '<leader>mr', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end, {})
map('n', '<leader>H', builtin.help_tags, {})
map('n', 'Q', builtin.commands, {})
map('n', 'qq', builtin.command_history, {})
map('n', 'q/', builtin.search_history, {})
map('n', '<leader>man', builtin.man_pages, {})
map('n', '<leader>qf', builtin.quickfix, {})
map('n', '<leader>qh', builtin.quickfixhistory, {})
map('n', '<leader>b', builtin.current_buffer_fuzzy_find, {})


local tel = require 'telescope'
tel.setup {
  defaults = {
    mappings = {
      i = {
        -- ["<C-b>"] = "move_selection_previous",
        -- ["<esc>"] = "close",
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

tel.load_extension('fzf')
tel.load_extension('flutter')

require("flutter-tools").setup{
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
    }
  },
  lsp = {
    color = {
      enabled = true
    },
    on_attach = require("lsp-format").on_attach,
  },
}

local map = vim.keymap.set

-- flutter shortcuts
map('n', '<leader>fd', ':FlutterRun -d all')
map('n', '<leader>fp', ':FlutterRun --dart-define=LICHESS_HOST=https://lichess.org -d all')
map('n', '<leader>fl', ':FlutterRun --dart-define=LICHESS_HOST=http://localhost:9663 -d all')
map('n', '<leader>ft', function() require('telescope').extensions.flutter.commands() end)

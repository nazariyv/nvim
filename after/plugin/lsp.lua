-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  gopls = {},
  rust_analyzer = {},
  tsserver = {},
  ansiblels = {},
  bashls = {},
  dockerls = {},
  cssls = {},
  cssmodules_ls = {},
  unocss = {},
  diagnosticls = {},
  eslint = {},
  elixirls = {},
  golangci_lint_ls = {},
  graphql = {},
  html = {},
  jsonls = {},
  ltex = {},
  lua_ls = {},
  marksman = {},
  ruff_lsp = {},
  sqlls = {},
  solang = {},
  taplo = {},
  tailwindcss = {},
  terraformls = {},
  -- ! spent way over one hour and could not make this work
  -- ! every yaml file would be ridden with "Wrong ordering of key "XXX" in
  -- ! mapping". 
  -- ! docs here: https://github.com/redhat-developer/yaml-language-server#language-server-settings
  -- ! mention by default keyOrdering should be false, but it is not.
  -- ! I am not including 'settings' key here because of the way mason-lspconfig
  -- ! pulls the settings below. But according to these dot files, my config
  -- ! should work: https://github.com/folke/dot/blob/6dbf11746c9d1e0883ab8db4703e29a2d85606d7/nvim/lua/plugins/lsp.lua#L90
  -- * above expresses my frustration. however I have made it work. I needed to
  -- * avoid the `settings` key, and then also instead of writing
  -- * keyOrdering = { enabled = false } I had to keyOrdering = false directly
  -- * I also had to manually remove yaml-language-server in :Mason
  -- * to check if yamlls is indeed attached to current buffer write :LspInfo
  -- * I am going to leave this comment in here for some time as a note to recall
  -- * the steps I have done if I ever need to refresh my memory
  yamlls = {
    yaml = {
      keyOrdering = false,
    },
  }
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

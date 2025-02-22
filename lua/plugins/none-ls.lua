return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins
    null_ls.setup({
      sources = {
        b.formatting.stylua,
        b.formatting.prettier.with({
          filetypes = {
            "html",
            "markdown",
            "css",
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact"
          }
        }), -- so prettier works only on these filetypes
        -- b.formatting.clang_format,
        -- python static analysis and formatting
        b.diagnostics.mypy,
        -- b.diagnostics.ruff,
        -- require("none-ls.diagnostics.ruff"),
        b.formatting.black.with({ filetypes = { "python" } }),
        -- shellcheck
        -- b.diagnostics.shellcheck,
        -- require("none-ls.diagnostics.shellcheck"),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ timeout_ms = 2000 })
            end,
          })
        end
      end,
    })
  end,
}

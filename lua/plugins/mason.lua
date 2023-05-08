local opts = {
  ensure_installed = {
    "actionlint",
    "goimports",
    "gofumpt",
    "golangci-lint",
    "google-java-format",
    "latexindent",
    "markdownlint",
    "prettier",
    "sql-formatter",
    "shellcheck",
    "shfmt",
    "stylua",
    "tflint",
    "yamllint",
  },
  ui = {
    border = "rounded",
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },
  },
}
require("mason").setup(opts)
local mr = require("mason-registry")
local function install_ensured()
  for _, tool in ipairs(opts.ensure_installed) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end
if mr.refresh then
  mr.refresh(install_ensured)
else
  install_ensured()
end
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssmodules_ls",
    "denols",
    "dockerls",
    "eslint",
    "gopls",
    "graphql",
    "html",
    "jdtls",
    "jsonls",
    "julials",
    "ltex",
    "lua_ls",
    "marksman",
    "pylsp",
    "pyright",
    "sqlls",
    "tailwindcss",
    "terraformls",
    "texlab",
    "tsserver",
    "vimls",
    "yamlls",
  },
  automatic_installation = true,
})


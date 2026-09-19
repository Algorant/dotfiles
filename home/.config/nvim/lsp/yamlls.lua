return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", },
  root_markers = { "package.json", ".git" },
  settings = {
    yaml = {
      format = {
        enable = true,
      }
    }
  }
}

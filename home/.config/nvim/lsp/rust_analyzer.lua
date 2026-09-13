return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
  settings = {
    ["rust-analyzer"] = {
      lens = {
        debug = {
          enable = true
        },
        enable = true
      }
    }
  }
}

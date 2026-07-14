return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        mason = false,
        cmd = { "/home/ark/.nix-profile/bin/rust-analyzer" },
      },
    },
  },
}

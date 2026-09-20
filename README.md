# dotfiles

My [arch linux](https://archlinux.org/) setup, managed with `sysup` and [mise](https://mise.jdx.dev/).

## the stack

- **sysup:** [script](home/.local/bin/sysup) — runs system, tool, Pi setup, and post-update checks in a consistent order

  ```text
  sysup          # run the normal update cycle
  sysup status   # inspect pending updates and current versions
  sysup agents   # update coding agents
  sysup rust     # update the Rust toolchain
  sysup help     # show all commands
  ```

- **mise:** [config](config/config.toml) | [project](https://mise.jdx.dev/) — manages development tools and the dotfiles setup
  - **profiles:** [config](config/config.toml) — share a common base while allowing different configuration for each kind of machine
  - **bootstrap:** [config](config/config.toml) | [project](https://jdx.dev/posts/2026-09-07-dotfiles-that-save-themselves/) — tracks live configuration and syncs saved changes without manually managing Git commits
  - **fnox:** [project](https://fnox.jdx.dev/) — resolves Proton Pass references for migrated consumers

## profiles

Most configuration is shared. Profiles define what is unique to a particular system or group of machines:

- **laptop:** arch linux with niri and noctalia
- **desktop:** arch linux under WSL with windows integration
- **homelab:** arch linux configured as a headless server

## what this repository is

This is a generated snapshot of the configuration I actually run, published from a private source repository. Identity, secrets, host access, and credential integration metadata are tracked privately and never published, so `config/config.toml` declares a few tracked paths whose files are intentionally absent here: git identity, fnox manifests, `ketch-sync`, and SSH configuration. Usernames, home paths, hostnames, locations, and hardware names are replaced with generic examples.

## tools and software

### desktop environment

- niri: [config](home@laptop/.config/niri/) | [project](https://github.com/niri-wm/niri)
- noctalia: [config](home@laptop/.config/noctalia/) | [project](https://github.com/Algorant/noctalia)
- fuzzel: [config](home@laptop/.config/fuzzel/) | [project](https://codeberg.org/dnkl/fuzzel)
- wireplumber: [config](home@laptop/.config/wireplumber/) | [project](https://pipewire.pages.freedesktop.org/wireplumber/)

### shell and terminal

- zsh: [config](home/.config/zsh/) | [project](https://www.zsh.org/)
- ghostty: [config](home/.config/ghostty/) | [project](https://ghostty.org/)
- starship: [config](home/.config/starship.toml) | [project](https://starship.rs/)
- atuin: [config](home/.config/atuin/) | [project](https://atuin.sh/)

### editor

- neovim: [config](home/.config/nvim/) | [project](https://neovim.io/)

### clis

- ketch: [config](config/config.toml) | [project](https://github.com/Algorant/ketch)
- worktrunk: [config](home/.config/worktrunk/config.toml) | [project](https://worktrunk.dev/)
- bat: [config](home/.config/bat/) | [project](https://github.com/sharkdp/bat)
- fd: [config](home/.config/fd/) | [project](https://github.com/sharkdp/fd)
- lsd: [config](home/.config/lsd/) | [project](https://github.com/lsd-rs/lsd)
- xurl: [config](config/config.toml) | [project](https://github.com/xdevplatform/xurl)
- croc: [config](config/config.toml) | [project](https://github.com/schollz/croc)

### tuis

- yazi: [config](home/.config/yazi/) | [project](https://yazi-rs.github.io/)
- btop: [config](home/.config/btop/) | [project](https://github.com/aristocratos/btop)
- ncspot: [config](home/.config/ncspot/config.toml) | [project](https://github.com/hrkfdn/ncspot)

### development

- git: [config](home/.config/git/) | [project](https://git-scm.com/)
- bun: [config](config/config.toml) | [project](https://bun.sh/)
- node.js: [config](config/config.toml) | [project](https://nodejs.org/)
- uv: [config](config/config.toml) | [project](https://docs.astral.sh/uv/)
- rust: [config](config/config.toml) | [project](https://www.rust-lang.org/)
- playwright: [config](config/config.toml) | [project](https://playwright.dev/)

### agents

- Pi: [config](config/config.toml) | [project](https://github.com/earendil-works/pi)
- Herdr: [config](home/.config/herdr/config.toml) | [project](https://github.com/Algorant/herdr)
- Tandem: [config](home/.config/tandem/) | [project](https://github.com/Algorant/tandem)
- Sideshow: [config](config/config.toml) | [project](https://github.com/modem-dev/sideshow)
- Claude Code: [config](config/config.toml) | [project](https://github.com/anthropics/claude-code)
- Codex: [config](config/config.toml) | [project](https://github.com/openai/codex)
- OpenCode: [config](config/config.toml) | [project](https://github.com/anomalyco/opencode)
- GitHub Copilot: [config](config/config.toml) | [project](https://github.com/github/copilot-cli)

### media

- mpv: [config](home/.config/mpv/) | [project](https://mpv.io/)

### theme

- verdigris: [config](home/.config/theme_colors/) | [project](https://github.com/Algorant/verdigris)

See [modern unix](https://github.com/Algorant/modern-unix) for a closer look at the command-line and terminal tools I use.

## why this setup?

The AUR is great for system and desktop software, but fast-moving agent tooling often changes faster than system package repositories. I prefer to keep the tools I use every day near the leading edge, so mise manages that layer while arch and the AUR continue to manage the system.

[nix](https://nixos.org/) is another compelling option, and one I may revisit. For now, mise fits how I work: it handles fast-moving tools and provides a thoughtful way to keep configuration aligned across different machines.

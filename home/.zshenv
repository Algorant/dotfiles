# Zsh environment loaded for every zsh invocation.
# Keep this file small and side-effect free: it is also sourced by non-interactive shells.

# Store the rest of the zsh configuration under XDG config.
export ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# ~/.pi is the Pi configuration repository. Keep conversations in a dedicated,
# ignored directory and expose its maintenance commands without a config override.
export PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions"
# User-owned mise must also resolve in non-interactive SSH and agent commands.
path=("$HOME/.local/bin" "$HOME/.pi/agent/bin" $path)
export PATH

# Mise owns the coding-agent release lifecycle. Disable the self-updaters that
# would otherwise compete with the opt-in `sysup agents` group.
export DISABLE_AUTOUPDATER=1
export OPENCODE_DISABLE_AUTOUPDATE=1

# Proton Pass CLI's kernel keyring is volatile: reboot clears it on dellmini,
# and WSL can revoke a session keyring while long-lived agents still use it.
# Both hosts already use the documented filesystem backend. Set it for every
# shell, not only interactive shells, so agents use the same key as login.
# local.key is mode 0600 beside the encrypted session; other hosts keep keyring.
if [[ "$HOST" == "dellmini" || "$HOST" == "The-Desktop" ]]; then
  export PROTON_PASS_KEY_PROVIDER="fs"
fi

# Expose mise shims early so commands launched from zsh, including Git hooks,
# can find project-pinned tools such as dotnet and node without requiring an
# interactive `mise activate` shell.
if [[ -d "$HOME/.local/share/mise/shims" ]]; then
  path=("$HOME/.local/share/mise/shims" $path)
  export PATH
fi

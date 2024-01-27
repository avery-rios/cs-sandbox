\(config : { gui : Bool }) ->
  { privileged = True
  , image = "mcr.microsoft.com/devcontainers/universal:linux"
  , features =
    { `ghcr.io/devcontainers/features/nix:1`.extraNixConfig
      =
        ''
        experimental-features = nix-command flakes ca-derivations
        ''
    , `ghcr.io/devcontainers-contrib/features/tmux-apt-get:1` = {=}
    , `ghcr.io/devcontainers-contrib/features/ripgrep:1` = {=}
    , `ghcr.io/devcontainers-contrib/features/fd:1` = {=}
    , `ghcr.io/devcontainers-contrib/features/nushell:1` = {=}
    , `ghcr.io/devcontainers/features/desktop-lite:1` =
        if config.gui then Some {=} else None {}
    }
  }
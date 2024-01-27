let concatSep = https://prelude.dhall-lang.org/v23.0.0/Text/concatSep

in  \(config : { gui : Bool }) ->
      { image = "mcr.microsoft.com/devcontainers/base:debian"
      , privileged = True
      , features =
        { `ghcr.io/devcontainers/features/nix:1` =
          { version = "latest"
          , packages =
              concatSep
                ","
                [ "nushell"
                , "zellij"
                , "ripgrep"
                , "fd"
                , "jq"
                , "eza"
                , "bat"
                , "htop"
                ]
          }
        , `ghcr.io/devcontainers/features/sshd:1` = {=}
        , `ghcr.io/devcontainers/features/desktop-lite:1` =
            if config.gui then Some {=} else None {}
        }
      }

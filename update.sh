#!/bin/sh

set -o verbose

dhall-to-json --file gui.dhall --output .devcontainer/gui/devcontainer.json
dhall-to-json --file cli.dhall --output .devcontainer/cli/devcontainer.json